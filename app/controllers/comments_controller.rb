class CommentsController < ApplicationController
  before_action :load_commentable

  def create
    @commentable.comments.create(comment_params)
    
    if params[:project_id]
      redirect_to project_path(@commentable) 
    else
      redirect_to user_path(@commentable)
    end
  end

  def destroy
    
  end

  private
  def load_commentable
    @commentable = if params[:project_id]
      Project.find(params[:project_id])
    else
      User.find(params[:user_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
