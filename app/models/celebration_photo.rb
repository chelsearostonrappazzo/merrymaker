class CelebrationPhoto < ApplicationRecord
  belongs_to :photo
  belongs_to :user 
  belongs_to :celebration
end
