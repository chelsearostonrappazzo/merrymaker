class User < ApplicationRecord
  has_many :members
  has_many :cabals, through: :members
  has_many :invites
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def full_name
    first_name + " " + last_name
  end
end
