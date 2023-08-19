class AddBookingIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :booking_id, :integer
  end
end
