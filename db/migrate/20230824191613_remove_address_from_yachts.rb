class RemoveAddressFromYachts < ActiveRecord::Migration[7.0]
  def change
    remove_column :yachts, :address, :string
  end
end
