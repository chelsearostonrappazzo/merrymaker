class Member < ApplicationRecord
  belongs_to :cabal
  belongs_to :user
  belongs_to :celebration
end
