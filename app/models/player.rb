class Player < ApplicationRecord
  belongs_to :team, optional: true
  has_many :counters, class_name: 'PlayerCounter', dependent: :destroy
  has_many :achievements, class_name: 'PlayerAchievement', dependent: :destroy

  validates_presence_of :name

  def set_counter(match, counter, value, force: false)
    match = self.class.find_object(Match, match, field: :location)

    unless (force || match.teams.include?(team))
      raise 'Player is not a member of participating teams'
    end

    counter = self.class.find_object(Counter, counter)

    player_counter = counters.find_or_initialize_by match: match, counter: counter
    player_counter.value = value
    player_counter.save!
    player_counter
  end

  def award_achievement(match, achievement, force: false)
    match = self.class.find_object(Match, match, field: :location)

    unless (force || match.teams.include?(team))
      raise 'Player is not a member of participating teams'
    end

    achievement = self.class.find_object(Achievement, achievement)

    achievements.find_or_create_by! match: match, achievement: achievement
  end
end
