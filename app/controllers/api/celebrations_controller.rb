class Api::CelebrationsController < ApplicationController
  before_action :authenticate_user
  # before_action :authenticate_admin, except: [:index, :show]

  def index
    # @celebrations = Celebration.all
    @celebrations = current_user.celebrations
    render "index.json.jb"
  end

  def show
    celebration_id = params[:id]
    @celebration = Celebration.find(celebration_id)
    render "show.json.jb"
  end

  def create
    status = "planning"
    @celebration = Celebration.new(
      user_id: current_user.id,
      name: params[:name],
      occasion: params[:occasion],
      theme: params[:theme],
      colors: params[:colors],
      signature_drink: params[:signature_drink],
      location: params[:location],
      activity: params[:activity],
      notes: params[:notes],
      status: status,
    )
    #happy/sad path
    if @celebration.save
      render "show.json.jb"
    else
      render json: { errors: @celebration.errors.full_messages }, status: 406
    end
  end

  def update
    celebration_id = params[:id]
    @celebration = Celebration.find_by(id: celebration_id)
    if current_user.id == @celebration.user.id
      @celebration.name = params[:name] || @celebration.name
      @celebration.occasion = params[:occasion] || @celebration.occasion
      @celebration.theme = params[:theme] || @celebration.theme
      @celebration.colors = params[:colors] || @celebration.colors
      @celebration.signature_drink = params[:signature_drink] || @celebration.signature_drink
      @celebration.location = params[:location] || @celebration.location
      @celebration.activity = params[:activity] || @celebration.activity
      @celebration.notes = params[:notes] || @celebration.notes
      @celebration.status = params[:status] || @celebration.status
      if @celebration.save
        render "show.json.jb"
      else
        render json: { errors: @celebration.errors.full_messages }, status: 406
      end
    else
      render json: { errors: "This isn't about you! Only the Celebrant can update!" }
    end
  end
end
