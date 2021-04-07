class User < ApplicationRecord
  has_many :members
  has_many :cabals, through: :members
  has_many :celebrations, through: :members
  has_many :roles, through: :members
end
