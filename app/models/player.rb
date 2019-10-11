class Player < ApplicationRecord
  belongs_to :team, optional: true
  has_many :counters, class_name: 'PlayerCounter', dependent: :destroy
  has_many :achievements, class_name: 'PlayerAchievement', dependent: :destroy

  validates_presence_of :name
end
