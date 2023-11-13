require_relative "../../lib/property_api.rb"

class SyncPropertiesJob < ApplicationJob
  queue_as :default

  def perform
    # Enter your API key here
    # property_api_key =
    property_api = PropertyAPI.new(Rails.application.credentials.development.PROPERTY_API_KEY)
    property_ids = Availability.pluck(:property_id).uniq

    property_ids.each do |property_id|
      property = Property.find_or_initialize_by(
          id: property_id
      )

      response = property_api.get_property(property.external_id)

      property.update(
        name: response['name'],
        primary_photo_url: response['photos'].first,
        city: response['city'],
        country_code: response['country_code'],
        state: response['state'],
        lat: response['lat'],
        lng: response['lng'],
        amenities: response['amenities'].to_json,
        photos: response['photos'],
        property_style: response['property_style'],
        property_type: response['property_type'],
        max_occupancy: response['max_occupancy'],
        square_feet: response['square_feet'],
        description: response['description'],
        view_from_property: response['view_from_property'],
        nearest_airport: response['nearest_airport'],
        distance_from_airtport: response['distance_from_airport'],
        bedrooms_count: response['bedrooms_count'],
        activities: response['activities'],
        interest_places: response['interest_places'],
        interest_activities: response['interest_activities'],
        reviews: response['reviews'],
      )
    end
  end
end