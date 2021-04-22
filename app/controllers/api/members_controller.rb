class Api::MembersController < ApplicationController
  def create
    @cabal = Cabal.find_by(invitation_token: params[:invitation_token])
    @membership = current_user.members.create(cabal_id: @cabal.id)
    if @membership.save
      render json: { message: "You have joined this group!" }
    else
      render json: { errors: "Unable to join!" }, status: 406
    end
  end
end
