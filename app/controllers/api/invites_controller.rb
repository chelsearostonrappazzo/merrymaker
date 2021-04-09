class Api::InvitesController < ApplicationController
  before_action :authenticate_user

  def create
    @invite = Invite.new(
      user_id: current_user.id,
      cabal_id: params[:cabal_id],
    )
    if @invite.save
      render "show.json.jb"
    end
  end

  def index
    @invites = current_user.invites
    render "index.json.jb"
  end
end
