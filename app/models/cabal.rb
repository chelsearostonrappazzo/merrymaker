class Cabal < ApplicationRecord
  has_many :members
  has_many :celebrations
  has_many :users, through: :members
  has_many :invites
  has_secure_token :invitation_token

end
