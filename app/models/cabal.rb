class Cabal < ApplicationRecord
  has_many :members
  has_many :users, through: :members
  has_many :celebrations, through: :members
end
