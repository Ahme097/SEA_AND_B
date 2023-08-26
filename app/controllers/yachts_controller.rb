class YachtsController < ApplicationController
  before_action :set_yacht, only: %i[show edit update destroy]
  before_action :set_user, only: %i[new create]

  def index
    if params[:query].present?
      @yachts = Yacht.search_yacht_by_address(params[:query])
    else
      @yachts = Yacht.all
      @markers = @yachts.geocoded.map do |yacht|
        {
          lat: yacht.latitude,
          lng: yacht.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: { yacht: })
          # marker_html: render_to_string(partial: "marker")
        }
      end
    end
  end

  def show
    @yacht = Yacht.find(params[:id])
    # @yachts = Yacht.all
    @reviews = @yacht.reviews
    @markers = [
      {
        lat: @yacht.latitude,
        lng: @yacht.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { yacht: @yacht })
        # marker_html: render_to_string(partial: "marker")
      }
    ]
  end

  def new
    @yacht = current_user.yachts.new
    @reviews = @yacht.reviews
  end

  def create
    @yacht = Yacht.new(yacht_params)
    @yacht.user = current_user

    if @yacht.save!
      # Upload images to Cloudinary and associate their URLs with the yacht
      uploaded_yacht_image = Cloudinary::Uploader.upload(params[:yacht][:yacht_image].tempfile)
      uploaded_interior_image = Cloudinary::Uploader.upload(params[:yacht][:yacht_interior_image].tempfile)
      uploaded_cabin_image = Cloudinary::Uploader.upload(params[:yacht][:yacht_cabin_image].tempfile)

      @yacht.update!(
        yacht_image: uploaded_yacht_image['secure_url'],
        yacht_interior_image: uploaded_interior_image['secure_url'],
        yacht_cabin_image: uploaded_cabin_image['secure_url']
      )
      redirect_to @yacht, notice: 'Yacht was successfully created.'
    else
      render :new
    end
  end

  def owner_yachts
    @user = User.find(params[:user_id])
    @yachts = @user.yachts
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

  def set_user
    @user = current_user
  end

  def set_yacht
    @yacht = Yacht.find(params[:id])
  end

  def yacht_params
    params.require(:yacht).permit(
      :max_guest, :cabin, :price_per_day, :description, :name,
      :yacht_image, :yacht_interior_image, :yacht_cabin_image,
      :address
    )
  end
end
