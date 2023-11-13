require_relative "../../lib/property_api.rb"

class SyncAvailabilitiesJob < ApplicationJob
    queue_as :default
  
    def perform
      # Enter your API key here
      # property_api_key = 
      property_api = PropertyAPI.new(Rails.application.credentials.development.PROPERTY_API_KEY)
  
      # Get the total number of pages
      response = property_api.get_availabilities
      total_pages = response["total_pages"]
  
      (1..total_pages).each do |page|
        response = property_api.get_availabilities({
            page: page
        })

        response['availabilities'].each do |availability_data|
          availability = Availability.find_or_initialize_by(
            external_id: availability_data['id']
          )

          property = Property.find_or_initialize_by(
            external_id: availability_data['property_id']
          )
          property.save
          if property.errors.any?
            puts property.errors.full_messages
          end

          availability.update(
            property_id: property.id,
            starts_on: availability_data['starts_on'],
            ends_on: availability_data['ends_on'],
            reserve_keys: availability_data['reserve_keys'],
            reserve_price: availability_data['reserve_price'],
          )
          if availability.errors.any?
            puts availability.errors.full_messages
          end
        end
      end
    end
  end
  