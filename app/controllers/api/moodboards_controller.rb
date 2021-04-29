class Api::MoodboardsController < ApplicationController
  def index
    @moodboards = current_user.moodboards
    render "index.json.jb"
  end
end
