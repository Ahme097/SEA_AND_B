class CreateYachts < ActiveRecord::Migration[7.0]
  def change
    create_table :yachts do |t|

      t.timestamps
    end
  end
end
