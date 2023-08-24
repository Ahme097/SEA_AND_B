class Yacht < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews


  include PgSearch::Model
pg_search_scope :search_yacht_by_address,
  against: [ :address ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
