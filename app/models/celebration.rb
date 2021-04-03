class Celebration < ApplicationRecord
  has_many :members
  has_many :cabals, through: :members
  has_many :users, through: :members
end
