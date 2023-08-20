class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]
  # before_action :set_all_bookings, only: %i[all_bookings]
  before_action :set_yacht, only: [:new, :create]
  before_action :set_user, only: [:my_bookings]

  def yacht_bookings
    @bookings = @yacht.bookings
  end

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.last
  end

  def new
    @booking = current_user.bookings.new(yacht: @yacht)
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.total_price = (booking_params[:end_date].to_date - booking_params[:start_date].to_date).to_i * @yacht.price_per_day
    @booking.yacht = @yacht
    @booking.user = current_user
    if @booking.save!
      redirect_to my_bookings_user_path(current_user), notice: 'Booking was successfully created.'
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
    redirect_to my_bookings_user, notice: 'Booking was successfully destroyed.'
  end

  def my_bookings
    @bookings = @user.bookings
  end

  def all_bookings
    @user_bookings = Booking.where(user_id: current_user.id)
  end

  # def calculate_total_price
  #   yacht = Yacht.find(yacht_id)
  #   self.total_price = (end_date.to_date - start_date.to_date).to_i * yacht.price_per_day
  # end

  private

  def set_user
    @user = current_user
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_yacht
    @yacht = Yacht.find(params[:yacht_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  # def set_all_bookings
  #   @bookings = Booking.where(user_id: current_user.id)
  # end
end
