require 'rails_helper'

RSpec.describe Response, type: :model do
  # Association test
  # ensure Request model has a 1:m relationship with the Message model
  it { should belong_to(:request) }
  it { should belong_to(:user) }
end
