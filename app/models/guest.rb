class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :celebration 
  validates_uniqueness_of :user_id, :scope => :celebration_id
end
