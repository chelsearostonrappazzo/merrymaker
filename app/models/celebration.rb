class Celebration < ApplicationRecord
  belongs_to :user
  belongs_to :cabal
  has_many :moodboards
  has_many :photos, through: :moodboards
  has_many :guests
  has_many :users, through: :guests
  has_many :comments
end
