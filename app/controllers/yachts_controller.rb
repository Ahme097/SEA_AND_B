class YachtsController < ApplicationController
  before_action :set_yacht, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @yachts = Yacht.search_yacht_by_address(params[:query])
    else
    @yachts = Yacht.all
    end
  end

  def show
    @yacht = Yacht.find(params[:id])
    @reviews = @yacht.reviews
  end

  def new
    @yacht = Yacht.new
  end

  def create
    @yacht = Yacht.new(yacht_params)

    if @yacht.save
      redirect_to @yacht, notice: 'Yacht was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @yacht.update(yacht_params)
      redirect_to @yacht, notice: 'Yacht was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @yacht = Yacht.find(params[:id])
    @yacht.destroy
    redirect_to yachts_path, notice: 'Yacht was successfully deleted.'
  end

  private

  def set_yacht
    @yacht = Yacht.find(params[:id])
  end

  def yacht_params
    params.require(:yacht).permit(:max_guest, :cabin, :yacht_image, :price_per_day, :description)
  end
end
