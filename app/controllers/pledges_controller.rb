class PledgesController < ApplicationController

  def create


  end


  def new_pledge
    @pledge = Pledge.create()
    @pledge.backer_id = current_user.id
    @pledge.tier_id = params[:tier]
    @pledge.amount = params[:amount]

    if @pledge.save
      redirect_to user_path(@pledge.backer_id), notice: "You are now backing this project!"
    else
      redirect_to projects_path, alert: "Uh, we've encountered a problem. Please try again!"
    end
  end

  def show
    
  end

  def destroy
    
  end

end
