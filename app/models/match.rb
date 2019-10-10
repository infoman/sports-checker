class Match < ApplicationRecord
  has_many :participants, class_name: 'MatchParticipant'
  has_many :teams, through: :participants

  validates_presence_of :location
  validates_length_of :participants, is: 2, allow_blank: false
end
