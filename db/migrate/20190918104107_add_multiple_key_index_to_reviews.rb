class AddMultipleKeyIndexToReviews < ActiveRecord::Migration[5.1]
  def change
    add_index :reviews, [:user_id, :created_at]
  end
end
