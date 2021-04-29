class Api::CommentsController < ApplicationController
  def create 
    @comments = Comment.create!(
      body: params[:body],
      user_id: current_user.id,
      celebration_id: params[:celebration_id]
    )
    if @comment.save
      render "show.json.jb"
    end
  end

  def index 
   
    @comments = Comment.all
    render "index.json.jb"
  end
end
