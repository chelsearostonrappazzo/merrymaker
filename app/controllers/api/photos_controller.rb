class Api::PhotosController < ApplicationController
  def search
    response = HTTP.get("https://pixabay.com/api/?key=#{Rails.application.credentials.pixabay_api[:api_key]}&q=#{params[:search]}&image_type=photo&pretty=true")
    data = response.parse
    @photos = data["hits"]
    render "index.json.jb"
  end

  def create
    @photo = Photo.new(
      photo: params[:photo],
    )
    if @photo.save
      render json: { message: "Added to faves" }
    else
      render json: { errors: photo.errors.full_messages }, status: :bad_request
    end
  end
end
