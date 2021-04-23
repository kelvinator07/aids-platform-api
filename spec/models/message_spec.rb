require 'rails_helper'

RSpec.describe Message, type: :model do
  # Association test
  # ensure Request model has a 1:m relationship with the Message model
  it { should belong_to(:user) }
  it { should belong_to(:response) }

  # Validation tests
  it { should validate_presence_of(:content) }
end
