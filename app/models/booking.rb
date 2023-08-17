class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :yacht
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true

  def confirmed?
    is_confirmed == true
  end
end
