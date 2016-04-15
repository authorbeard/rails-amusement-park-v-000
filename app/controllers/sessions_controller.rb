class SessionsController < ApplicationController

  def new

  end

  def create
    # binding.pry
    user=User.find_by(user_params)
    if user
      login(user)
      current_user
      redirect_to user_path(user), :notice=>"Welcome back to the theme park!"
    end
  end

  def destroy

  end

  private
    def user_params
      params.require(:user).permit(:id)
    end   


end
