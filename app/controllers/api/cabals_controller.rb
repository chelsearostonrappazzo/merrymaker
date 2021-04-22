class Api::CabalsController < ApplicationController
  before_action :authenticate_user
  # before_action :authenticate_admin, except: [:index, :show]
  def index
    @cabals = current_user.cabals
    render "index.json.jb"
  end

  def show
    cabal_id = params[:id]
    @cabal = Cabal.find(cabal_id)
    render "show.json.jb"
  end

  def create
    @cabal = Cabal.new(
      name: params[:name],
    )
    #happy/sad path
    if @cabal.save
      @user = current_user.id
      @cabal.members.create!(cabal_id: @cabal.id, user_id: @user)
      render "show.json.jb"
    else
      render json: { errors: @cabal.errors.full_messages }, status: 406
    end
  end

  def update
    cabal_id = params[:id]
    @cabal = Cabal.find(cabal_id)
    @cabal.name = params[:name] || @cabal.name

    if @cabal.save
      render "show.json.jb"
    else
      render json: { errors: @cabal.errors.full_messages }, status: 406
    end
  end

  def join
    @cabal = Cabal.find(params[:invitation_token])
    @cabalmember = @cabal.members.create!(cabal_id: @cabal.id, user_id: current_user.id)
    if @cabalmember.save
      render json: { members: "#{@cabalmember}" }
    else
      render json: { message: "Unable to join!" }
    end
  end
end
