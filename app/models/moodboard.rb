class Moodboard < ApplicationRecord
  belongs_to :user
  belongs_to :photo
  belongs_to :celebration
end
