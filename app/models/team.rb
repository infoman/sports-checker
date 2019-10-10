class Team < ApplicationRecord
  has_many :players, dependent: :nullify
end
