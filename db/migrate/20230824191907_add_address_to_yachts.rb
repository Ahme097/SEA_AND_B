class AddAddressToYachts < ActiveRecord::Migration[7.0]
  def change
    add_column :yachts, :address, :string
  end
end
