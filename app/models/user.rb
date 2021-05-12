class User < ApplicationRecord
  has_many :members
  has_many :cabals, through: :members
  has_many :moodboards
  has_many :photos, through: :moodboards
  has_many :celebration_photos
  has_many :photos, through: :celebration_photos
  has_many :guests
  has_many :celebrations, through: :guests 
  has_many :comments
  has_one_attached :avatar
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def full_name
    first_name + " " + last_name
  end
end
