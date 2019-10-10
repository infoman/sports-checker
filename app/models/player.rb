class Player < ApplicationRecord
  belongs_to :team, optional: true

  validates_presence_of :name
end
