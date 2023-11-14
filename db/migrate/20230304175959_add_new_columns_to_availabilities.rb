class AddNewColumnsToAvailabilities < ActiveRecord::Migration[7.0]
  def change
    add_column :availabilities, :reserve_keys, :integer
    add_column :availabilities, :reserve_price, :float
  end
end
