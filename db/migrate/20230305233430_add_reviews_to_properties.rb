class AddReviewsToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :reviews, :jsonb
  end
end
