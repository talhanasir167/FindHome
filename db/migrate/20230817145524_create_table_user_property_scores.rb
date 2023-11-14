class CreateTableUserPropertyScores < ActiveRecord::Migration[7.0]
  def change
    create_table :user_property_scores do |t|
      t.float :score, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true
      t.timestamps
    end
  end
end
