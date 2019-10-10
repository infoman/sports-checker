class CreateMatchParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :match_participants do |t|
      t.references :match, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
