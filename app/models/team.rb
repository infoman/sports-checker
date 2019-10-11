class Team < ApplicationRecord
  has_many :players, dependent: :nullify
  has_and_belongs_to_many :matches, inverse_of: :teams, join_table: :match_participants,
    dependent: :restrict_with_exception

  validates_presence_of :name

  def top_players(achievement, count: 5)
    achievement = self.class.find_object(Achievement, achievement)

    players.joins(:achievements).
      select('players.id, players.name, count(players.id) AS counter').
      group('id').
      where('player_achievements.achievement_id' => achievement.id).
      order('count(players.id) DESC').
      limit(count)
  end
end
