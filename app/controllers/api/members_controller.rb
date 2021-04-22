class Api::MembersController < ApplicationController
  def create
    @membership = current_user.members.create(:cabal_id => params[:cabal_id])
    if @membership.save
      render json: { message: "You have joined this group!" }
    else
      render json: { errors: "Unable to join!" }, status: 406
    end
  end
end
