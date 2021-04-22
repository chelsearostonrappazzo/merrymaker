class Member < ApplicationRecord
  belongs_to :cabal
  belongs_to :user

  def to_param
    invitation_token
  end
end
