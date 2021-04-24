class Api::UsersController < ApplicationController
  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      invite_token: params[:invite_token],
      image: params[:image],
      password_confirmation: params[:password_confirmation],
    )

    if @user.save
      invitation = params[:invite_token]
      if invitation != nil
        cabal = Cabal.find_by(invitation_token: invitation)
        @membership = @user.members.create(cabal_id: cabal.id)
      else
        render json: { errors: @membership.errors.full_messages}
      end
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    # user_id = params[:id]
    @user = User.find(current_user.id)
    render "show.json.jb"
  end

  def update
    @user = User.find(current_user.id)
    @user.last_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    @user.image = params[:image] || @user.image

    #happy/sad path
    if @user.save
      render "show.json.jb"
    else
      render json: { message: @user.errors.full_messages }, status: 406
    end
  end
end
