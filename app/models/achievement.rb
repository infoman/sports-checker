class Achievement < ApplicationRecord
  belongs_to :counter

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :threshold
end
