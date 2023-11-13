class UserPropertyScore < ApplicationRecord
  validates :score, presence: true
  
  belongs_to :user
  belongs_to :property
end