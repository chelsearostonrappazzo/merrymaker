class Celebration < ApplicationRecord
  belongs_to :user
  belongs_to :cabal
  has_many :moodboards
  has_many :photos, through: :moodboards
end
