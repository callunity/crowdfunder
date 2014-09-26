class TiersController < ApplicationController
  before_action :load_project

  def new
    @tier = Tier.new
  end

  def create
    @tier = Tier.create(tier_params)

    if @tier.save
      redirect_to project_path(@tier.project)
    else
      render :new
    end
  end

  def show

  end

  def destroy
    
  end

  private
  def tier_params
    params.require(:tier).permit(:description, :amount)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end
end
