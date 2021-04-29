class Api::CommentsController < ApplicationController
  def create 
    @celebration = Celebration.find(params[:celebration_id])
    @comments = @celebration.comments.create!(
      body: params[:text],
      user_id: current_user.id,
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
