class PlayerCounter < ApplicationRecord
  belongs_to :player
  belongs_to :match
  belongs_to :counter

  validates_numericality_of :value

  default_scope { includes(:player, :counter) }

  delegate :name, :unit, to: :counter, prefix: true
  delegate :name, to: :player, prefix: true

  after_save :award_achievements

  private
  def award_achievements
    counter.achievements.each do |achievement|
      player.award_achievement(match, achievement, force: true) if value >= achievement.threshold
    end
  end
end
