class WorkoutsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
    @workout = current_user.workouts.build(params[:workout])
    if @workout.save
      flash[:success] = "Workout logged!"
      respond_to do |format|
        format.html {redirect_to root_url}
        format.js
      end
    else
      @feed_items = []
      render 'home_and_info_pages/home'
    end
  end

  def destroy
    @workout.destroy
    redirect_to root_url(:pflag => params[:pflag])
  end
end
