class Api::UsersController < ApplicationController
  def create
    # @token = params[:invitation_token]
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      image: params[:image],
      password_confirmation: params[:password_confirmation],
    )

    if user.save
      render json: { message: "User created successfully! Welcome!" }, status: :created
      # if @token != nil
      #   group = Cabal.find_by(invitation_token: @token).members
      #   user.members.push(group)
      #   render json: { message: "You've been added to #{Cabal.find_by_token(@token).name}! Welcome!" }, status: :created
      # end
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
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

  def invite_member
    user = User.find(params[:user_id])
    invite = Member.new(user_id: params[:user_id], cabal_id: params[:cabal_id], status: "pending")
    if invite.save
    else
    end
  end

  def accept_invite
    invite = Member.find(params[:id])
    invite.status = "Accepted"
  end
end
