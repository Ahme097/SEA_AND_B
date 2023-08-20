class AddYachtInteriorImageToYachts < ActiveRecord::Migration[7.0]
  def change
    add_column :yachts, :yacht_interior_image, :string
  end
end
