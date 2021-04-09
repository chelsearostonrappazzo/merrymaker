class Invite < ApplicationRecord
  has_secure_token :invitation_token
  belongs_to :user
  belongs_to :cabal
end
