class User < ApplicationRecord
  has_many :user_property_scores
  has_many :properties, through: :user_property_scores
end
