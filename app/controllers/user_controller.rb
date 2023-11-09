class UserController < ApplicationController
  include Geocoder::Calculations

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @properties = get_interest_base_properties
    @nearby_properties = get_nearby_properties
  end

  private

  def get_nearby_properties
    latitude, longitude = user_coordinates_from_geocoder

    latitude && longitude && find_nearby_properties(latitude, longitude, Constants::DISTANCE_IN_MILES) || []
  end

  def user_coordinates_from_geocoder
    city_cordinates = Geocoder.search(@user.city)
    state_cordinates = Geocoder.search(@user.state) if city_cordinates.empty?
    cordinates =  state_cordinates || city_cordinates

    latitude = cordinates.first.data["lat"]
    longitude = cordinates.first.data["lon"]

    [latitude, longitude]
  end

  def find_nearby_properties(latitude, longitude, max_distance_miles)
    user_coordinates = [latitude, longitude]

    nearby_properties = Property.all.map do |property|
      property_coordinates = [property.lat, property.lng]
      distance_miles = distance_between(user_coordinates, property_coordinates) * 0.621371

      { property:, distance_miles: }
    end

    sorted_properties = nearby_properties
      .select { |prop| prop[:distance_miles] <= max_distance_miles }
      .sort_by { |prop| prop[:distance_miles] }
      .first(3)

    sorted_properties.map { |prop| prop[:property] }
  end

  def get_interest_base_properties
    Property.joins(:user_property_scores)
           .where(user_property_scores: { user_id: @user.id })
           .order('user_property_scores.score DESC')
           .first(3)
  end
end

