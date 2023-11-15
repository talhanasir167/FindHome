require 'rails_helper'

RSpec.describe UserPropertyScore, type: :model do
  it { should validate_presence_of(:score) }
  it { should belong_to(:user) }
  it { should belong_to(:property) }
end
