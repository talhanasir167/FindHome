
namespace :user_properties do
  desc "Populate user_property_scores table according to interests"
  task populate_scores: :environment do

    RATING = 2.5
    User.find_each do |user|
      user_property_scores(user)
    end
  end

  def user_property_scores(user)
    Property.find_each do |property|
      count = calculate_property_score(property, user.interests)
      user_property = user.user_property_scores.find_or_initialize_by(property: property)
      user_property.score = count.to_f / user.interests.count
      user_property.save!
    end
  end

  def calculate_property_score(property, interests)
    interests.sum do |interest|
      interest = interest.gsub('_', ' ')
      case interest
      when 'golf'
        property.activities[:golf] ? 1 : 0
      when 'only good reviews'
        calculate_reviews_score(property) ? 1 : 0
      else
        calculate_other_interest_score(property, interest) ? 1 : 0
      end
    end
  end

  def calculate_reviews_score(property)
    ratings_sum = property.reviews.pluck('rating').sum
    ratings_count = property.reviews.count

    ratings_sum.positive? && (ratings_sum / ratings_count) > RATING
  end

  def calculate_other_interest_score(property, interest)
    combined_data = [
      property.reviews.map { |json| JSON.dump(json) },
      property.description,
      property.interest_places,
      property.property_type,
      property.view_from_property
    ].flatten.join(' ')

    pattern = Regexp.new(Regexp.escape(interest), Regexp::IGNORECASE)
    combined_data =~ pattern
  end
end

