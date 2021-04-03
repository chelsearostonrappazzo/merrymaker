class Member < ApplicationRecord
  belongs_to :user
  belongs_to :cabal
  belongs_to :celebration
end
