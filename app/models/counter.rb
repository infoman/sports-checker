class Counter < ApplicationRecord
  has_many :achievements

  validates_presence_of :name
end
