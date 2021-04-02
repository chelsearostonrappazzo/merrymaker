class Cabal < ApplicationRecord
  has_many :users, through: :members
  belongs_to :celebration
  belongs_to :user
end
