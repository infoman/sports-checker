class Counter < ApplicationRecord
  has_many :achievements

  validates_presence_of :name
  validates_uniqueness_of :name
end
