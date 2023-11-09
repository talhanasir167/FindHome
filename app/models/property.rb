class Property < ApplicationRecord
  has_many :user_property_scores
  has_many :users, through: :user_property_scores
  
  has_many :availabilities
end
