class Team < ApplicationRecord
  has_many :players, dependent: :nullify

  validates_presence_of :name
end
