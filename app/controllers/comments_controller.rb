class CommentsController < ApplicationController
  before_action :load_commentable

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    
    if @comment.save
      if params[:project_id]
        redirect_to project_path(@commentable) 
      else
        redirect_to user_path(@commentable)
      end
    else 
      if params[:project_id]
        redirect_to project_path(@commentable), alert: "Something went wrong! Please try again." 
      else
        redirect_to user_path(@commentable), alert: "Something went wrong! Please try again."
      end
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
