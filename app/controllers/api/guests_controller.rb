class Api::GuestsController < ApplicationController
  before_action :authenticate_user
  # before_action :authenticate_admin, except: [:index, :show]
  def create
    @guests = Guest.create(celebration_id: params[:celebration_id], user_id: params[:user_id])
    if @guests.save
      render json: { message: "You have joined this event!" }
    else
      render json: { errors: "Unable to join!" }, status: 406
    end
  end

  
end
