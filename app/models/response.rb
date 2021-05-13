class Response < ApplicationRecord
  belongs_to :user
  belongs_to :request, counter_cache: true
  has_many :messages, dependent: :destroy

  def channel_name
    "response_#{id}"
  end

end
