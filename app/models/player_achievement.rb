class PlayerAchievement < ApplicationRecord
  belongs_to :player
  belongs_to :match
  belongs_to :achievement

  default_scope { includes(:player, :achievement) }

  delegate :name, to: :achievement, prefix: true
  delegate :name, to: :player, prefix: true
end
