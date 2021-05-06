class Member < ApplicationRecord
  belongs_to :cabal
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => :cabal_id
end
