require 'rails_helper'

RSpec.describe Request, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:responses).dependent(:destroy) }
  # Validation tests
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:request_type) }
  it { should validate_presence_of(:lat) }
  it { should validate_presence_of(:lng) }
end
