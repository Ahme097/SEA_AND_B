class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

def create
  @booking = Booking.new(booking_params)

  if @booking.save
    redirect_to @booking, notice: 'Booking was successfully created.'
  else
    render :new
  end
end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking was successfully destroyed.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :yacht_id, :start_date, :end_date, :total_price, :is_confirmed)
  end

  def calculate_total_price
    # Your Ruby logic to calculate the total price based on start_date, end_date, etc.
    # For example:
    # total_price = (end_date - start_date).to_i * yacht.price_per_day
    # Return the calculated total_price
  end
end
