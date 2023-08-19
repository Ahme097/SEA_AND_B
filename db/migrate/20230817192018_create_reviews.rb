class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :yacht_id
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
