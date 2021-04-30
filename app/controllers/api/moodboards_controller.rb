class Api::MoodboardsController < ApplicationController
  def index
    @moodboards = current_user.moodboards
    render "index.json.jb"
  end

  def destroy 
    moodboard_id = params[:moodboard_id]
    moodboard = Moodboard.find(moodboard_id)
    moodboard.destroy 
    render json: {message: "Deleted successfully!"}
  end
end
