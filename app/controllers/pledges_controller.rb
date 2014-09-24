class PledgesController < ApplicationController

  def create
    load_tier
    @pledge = Pledge.create(pledge_params)
    @pledge.backer_id = current_user.id

    if @pledge.save
      redirect_to project_path(@pledge.tier.project), notice: "You are now backing this project!"
    else
      redirect_to project_path(@tier.project), alert: "Uh, we've encountered a problem. Please try again!"
    end
  end

  def show
    
  end

  def destroy
    
  end

  private
  def pledge_params
    params.require(:pledge).permit(:amount, :tier_id)
  end

  def load_tier
    @tier = Tier.find(params[:id])
  end
end
