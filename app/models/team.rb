class Team < ApplicationRecord
  has_many :players, dependent: :nullify
  has_and_belongs_to_many :matches, inverse_of: :teams, join_table: :match_participants,
    dependent: :restrict_with_exception

  validates_presence_of :name

  def top_players(achievement, count: 5)
    players.top(achievement, count: count)
  end
end
