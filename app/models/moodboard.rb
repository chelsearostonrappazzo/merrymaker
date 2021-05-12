class Moodboard < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  belongs_to :celebration
  has_many_attached :image_file
end
