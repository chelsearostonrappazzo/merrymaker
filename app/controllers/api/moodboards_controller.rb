class Api::MoodboardsController < ApplicationController
  def index
    @moodboards = Moodboard.all
    render "index.json.jb"
  end
end
