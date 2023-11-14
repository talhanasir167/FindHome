class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.bigint :external_id
      t.string :name
      t.string :primary_photo_url
      t.string :city
      t.string :country_code
      t.string :state
      t.float :lat
      t.float :lng
      t.jsonb :amenities, default: [], array: true

      t.timestamps
    end
  end
end
