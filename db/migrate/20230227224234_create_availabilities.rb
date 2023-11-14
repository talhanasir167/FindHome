class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.date :starts_on
      t.date :ends_on
      t.references :property, null: false, foreign_key: true
      t.bigint :external_id

      t.timestamps
    end
  end
end
