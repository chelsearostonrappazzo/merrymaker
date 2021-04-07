class User < ApplicationRecord
  has_many :members
  has_many :cabals, through: :members
  has_many :celebrations, through: :members
  has_many :roles, through: :members
  
  has_secure_password
  validates :email, presence: true, uniqueness: true
  
end
