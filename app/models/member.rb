class Member < ApplicationRecord
  has_many :cabals
  has_many :users
end
