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
      current_user.cabal = @cabal.users
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
end
