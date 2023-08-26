class AddUserToYachts < ActiveRecord::Migration[7.0]
  def change
    remove_column :yachts, :user_id, :bigint
    add_reference :yachts, :user, foreign_key: true
  end
end
