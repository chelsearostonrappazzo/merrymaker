class User < ApplicationRecord
  has_many :cabals
  has_many :celebrations
  belongs_to :member
end
