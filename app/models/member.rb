class Member < ApplicationRecord
  belongs_to :cabal
  belongs_to :user
  belongs_to :celebration
  belongs_to :role
end
