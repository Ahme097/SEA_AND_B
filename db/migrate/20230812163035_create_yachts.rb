class CreateYachts < ActiveRecord::Migration[7.0]
  def change
    create_table :yachts do |t|
      t.integer :max_guest
      t.integer :cabin
      t.string :yacht_image
      t.string :name
      t.integer :price_per_day
      t.text :description

      t.timestamps
    end
  end
end
