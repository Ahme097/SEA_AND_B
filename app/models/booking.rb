class Booking < ApplicationRecord
  before_validation :calculate_total_price
  belongs_to :user
  belongs_to :yacht
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true

  def confirmed?
    is_confirmed == true
  end

  def calculate_total_price
    self.total_price = (end_date - start_date).to_i * yacht.price_per_day
  end
end
