class AddUniqueIndexesToThings < ActiveRecord::Migration[6.0]
  def change
    add_index :achievements, :name, unique: true

    add_index :counters, :name, unique: true

    # Team can not participate twice in the same match
    add_index :match_participants, [:match_id, :team_id], unique: true, name: 'participate_once'

    # Player can only have specific achievement once per match
    add_index :player_achievements, [:player_id, :match_id, :achievement_id], unique: true, name: 'achieve_once'

    # Player can only have specific counter once per match
    add_index :player_counters, [:player_id, :match_id, :counter_id], unique: true, name: 'count_once'
  end
end
