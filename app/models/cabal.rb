class Cabal < ApplicationRecord
  has_many :members
  has_many :celebrations, through: :members
  has_many :users, through: :members
end
