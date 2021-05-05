class Api::CommentsController < ApplicationController
  before_action :authenticate_user


  def create 
    @comment = Comment.new(
      body: params[:body],
      user_id: current_user.id,
      celebration_id: params[:celebration_id]
    )
    if @comment.save
      render "show.json.jb"
    else
      render json: {errors:  @comment.errors.full_messages}, status: 406
    end
  end

  def index 
   
    @comments = Comment.all
    render "index.json.jb"
  end

  def destroy 
    @comment = Comment.find(params[:id])
    @comment.destroy 
    render json: {message: "Deleted!"}
  end
end
