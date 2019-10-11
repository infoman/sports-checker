class Player < ApplicationRecord
  belongs_to :team, optional: true
  has_many :counters, class_name: 'PlayerCounter'
  has_many :achievements, class_name: 'PlayerAchievement'

  validates_presence_of :name
end
