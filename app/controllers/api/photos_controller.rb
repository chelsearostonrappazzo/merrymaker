class Api::PhotosController < ApplicationController
  before_action :authenticate_user  
  def search
    # response = HTTP.get("https://pixabay.com/api/?key=#{Rails.application.credentials.pixabay_api[:api_key]}&q=#{params[:search]}&image_type=photo&pretty=true")
    # data = response.parse
    # @photos = data["hits"]
    response = Pexels::Client.new(Rails.application.credentials.pexels_api[:api_key])
    @photos = response.photos.search(params[:search], per_page: 50)
    render "index.json.jb"
  end

  def create
    celebration_id = params[:celebration_id]
    @photo = Photo.new(
      photo: params[:photo],
      src_id: params[:src_id],
      color: params[:color],
    )
    if @photo.save
      @moodboard = current_user.moodboards.create!(photo_id: @photo.id, celebration_id: celebration_id)
      render json: { message: "Added to faves" }
    else
      render json: { errors: photo.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @photos = current_user.photos
    render "index2.json.jb"
  end
end
