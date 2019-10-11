class PlayerCounter < ApplicationRecord
  belongs_to :player
  belongs_to :match
  belongs_to :counter

  validates_numericality_of :value

  default_scope { includes(:player, :counter) }

  delegate :name, :unit, to: :counter, prefix: true
  delegate :name, to: :player, prefix: true
end
