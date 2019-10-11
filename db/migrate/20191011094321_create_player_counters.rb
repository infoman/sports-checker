class CreatePlayerCounters < ActiveRecord::Migration[6.0]
  def change
    create_table :player_counters do |t|
      t.references :player, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true
      t.references :counter, null: false, foreign_key: true
      t.decimal :value, null: false

      t.timestamps
    end
  end
end
