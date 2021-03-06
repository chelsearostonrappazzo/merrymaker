class Api::MembersController < ApplicationController
  before_action :authenticate_user

  def create
    @cabal = Cabal.find_by(invitation_token: params[:invitation_token])
    @membership = current_user.members.create(cabal_id: @cabal.id)
    if @membership.save
      render json: { message: "You have joined this group!" }
    else
      render json: { errors: "Unable to join!" }, status: 406
    end
  end

  def destroy
    @cabal = Cabal.find(params[:id])
    @membership = @cabal.members.find_by(user_id: current_user.id)
    @membership.destroy
    render json: { message: "You left the group!" }
  end

  def index
    @members = Member.all
    render "index.json.jb"
  end
end
