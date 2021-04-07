class Celebration < ApplicationRecord
  belongs_to :user
  has_many :members
  belongs_to :cabal
  has_many :users, through: :members
end
