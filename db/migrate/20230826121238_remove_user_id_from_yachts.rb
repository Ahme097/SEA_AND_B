class RemoveUserIdFromYachts < ActiveRecord::Migration[7.0]
  def change
    remove_column :yachts, :user_id, :bigint
  end
end
