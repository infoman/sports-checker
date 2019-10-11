class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.references :counter, null: false, foreign_key: true
      t.decimal :threshold, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
