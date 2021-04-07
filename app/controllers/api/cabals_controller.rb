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
      Member.create(cabal_id: @cabal.id, user_id: current_user.id)
      render "show.json.jb"
    else
      render json: { errors: @cabal.errors.full_messages }, status: 406
    end
  end

  def update
    celebration_id = params[:id]
    @celebration = Celebration.find(celebration_id)
    @celebration.name = params[:name] || @celebration.name
    @celebration.occasion = params[:occasion] || @celebration.occasion
    @celebration.theme = params[:theme] || @celebration.theme
    @celebration.colors = params[:colors] || @celebration.colors
    @celebration.signature_drink = params[:signature_drink] || @celebration.signature_drink
    @celebration.location = params[:location] || @celebration.location
    @celebration.activity = params[:activity] || @celebration.activity
    @celebration.notes = params[:notes] || @celebration.notes

    if @celebration.save
      render "show.json.jb"
    else
      render json: { errors: @celebration.errors.full_messages }, status: 406
    end
  end
end
