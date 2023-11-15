require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:user_property_scores) }
  it { should have_many(:properties).through(:user_property_scores) }
end
