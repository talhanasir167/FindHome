require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should have_many(:user_property_scores) }
  it { should have_many(:users).through(:user_property_scores) }
  
end
