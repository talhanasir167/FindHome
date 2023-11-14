class AddNewColumnsToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :property_style, :string
    add_column :properties, :property_type, :string
    add_column :properties, :max_occupancy, :integer
    add_column :properties, :square_feet, :integer
    add_column :properties, :description, :text
    add_column :properties, :view_from_property, :string
    add_column :properties, :nearest_airport, :string
    add_column :properties, :distance_from_airtport, :string
    add_column :properties, :bedrooms_count, :integer
    add_column :properties, :activities, :jsonb
    add_column :properties, :interest_places, :jsonb
    add_column :properties, :interest_activities, :jsonb
  end
end
