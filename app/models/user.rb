class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  # model association
  has_many :requests, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :responses, dependent: :destroy

  before_save { email.downcase! }

  has_one_attached :picture

  validates :firstname, :lastname, :picture, presence: true

  validates :email, presence: true, uniqueness: true

  def get_image_url
    url_for(self.picture)
  end

end
