class Photo < ApplicationRecord
  has_many :moodboards
  has_many :celebrations, through: :moodboards
end
