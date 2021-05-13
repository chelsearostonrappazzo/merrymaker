class Api::CelebrationPhotosController < ApplicationController
  def index
    @celebration_photos = current_user.celebration_photos
    render "index.json.jb"
  end
end
