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
      Member.create(cabal_id: @group.id, user_id: @user)
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

  def add
    @cabal = Cabal.find(params[:id])
    @cabalmembers = current_user.members.create(cabal_id: @cabal, user_id: current_user.id)
    render json: { members: "#{@cabalmembers}" }
  end
end
