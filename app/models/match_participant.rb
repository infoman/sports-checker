class MatchParticipant < ApplicationRecord
  belongs_to :match
  belongs_to :team

  validates_numericality_of :score, only_integer: true
end
