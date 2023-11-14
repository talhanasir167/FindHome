class AddPhotosToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :photos, :jsonb, default: [], array: true
  end
end
