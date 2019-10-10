class Team < ApplicationRecord
  has_many :players, dependent: :nullify
  has_and_belongs_to_many :matches, inverse_of: :teams, join_table: :match_participants

  validates_presence_of :name
end
