class Api::MoodboardsController < ApplicationController
  before_action :authenticate_user
  def index
    @moodboards = current_user.moodboards
    render "index.json.jb"
  end

  def destroy 
    @photo = Photo.find(params[:id])
    @moodboard = @photo.moodboards.find_by(user_id: current_user.id)
    @moodboard.destroy 
    render json: {message: "Deleted successfully!"}
  end
end
