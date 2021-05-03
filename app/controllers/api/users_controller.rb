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
      quote: params[:quote],
    )
  
    if @user.save
      invitation = params[:invite_token]
      UserMailer.with(user: @user).welcome_email.deliver_later
      if invitation.present?
        cabal = Cabal.find_by(invitation_token: invitation)
        @membership = @user.members.create(cabal_id: cabal.id)
      else
        render "show.json.jb"
      end
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def profile
    # user_id = params[:id]
    @user = User.find(current_user.id)
    render "show.json.jb"
  end

  def show 
    user_id = params[:id]
    @user = User.find(user_id)
    render "show.json.jb"
  end

  def update
    @user = User.find(current_user.id)
    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    @user.password_digest = params[:password] || @user.password_digest
    @user.image = params[:image] || @user.image
    @user.quote = params[:quote] || @user.quote

    #happy/sad path
    if @user.save
      render "show.json.jb"
    else
      render json: { message: @user.errors.full_messages }, status: 406
    end
  end
end
