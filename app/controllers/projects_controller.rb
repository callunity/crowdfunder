class ProjectsController < ApplicationController
  before_filter :require_login, only: [:new, :edit, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @project.tiers.new
  end

  def create
    @project = Project.create(project_params)
    @project.owner_id = current_user.id

    if @project.save
      redirect_to project_path(@project)
    else
      render :new, flash: "Error! Please try again"
    end
  end

  def show
    @project = Project.find(params[:id])
    @comment = @project.comments.new
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :goal, :start_date, :end_date, :comment_list, tiers_attributes: [:description, :amount, :_destroy])
  end

end
