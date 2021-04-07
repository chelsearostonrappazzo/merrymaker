class User < ApplicationRecord
  has_many :members
  has_many :cabals, through: :members
  has_many :celebrations, through: :members

  has_secure_password
  validates :email, presence: true, uniqueness: true

  # def full_name
  #   user.first_name + user.last_name
  # end
end
