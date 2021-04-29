class Request < ApplicationRecord
    # model association
    belongs_to :user

    has_many :responses, dependent: :destroy
    has_many :messages, dependent: :destroy

    scope :unfulfilled, -> { where(fulfilled: false) }
    scope :unfulfilled_and_less_than_five, -> { unfulfilled.where('responses_count < 5') }

    enum type: {
        one_time:                   'one_time',
        material_need:              'material_need'
    }

    validates :description, :request_type, :lat, :lng, presence: true

    def is_republishable
      last_time = responses.last.try(:updated_at)
      (last_time && last_time < 24.hours.ago) && responses.count >= 5
    end

end
