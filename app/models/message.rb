class Message < ApplicationRecord
  belongs_to :user
  # belongs_to :request
  belongs_to :response

  validates :content, presence: true

  def firstname
    user.firstname
  end
end
