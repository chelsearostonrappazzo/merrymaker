class Cabal < ApplicationRecord
  has_many :members
  has_many :celebrations
  has_many :users, through: :members
end
