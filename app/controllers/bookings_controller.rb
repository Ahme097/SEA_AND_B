class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_yacht, only: %i[new create]

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

    @booking.total_price = (booking_params[:end_date].to_date - booking_params[:start_date].to_date).to_i * @yacht.price_per_day
    @booking.yacht = @yacht
    @booking.user = current_user
    if @booking.save!
      redirect_to yacht_bookings_path(@yacht.id), notice: 'Booking was successfully created.'
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

  # def calculate_total_price
  #   yacht = Yacht.find(yacht_id)
  #   self.total_price = (end_date.to_date - start_date.to_date).to_i * yacht.price_per_day
  # end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_yacht
    @yacht = Yacht.find(params[:yacht_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
