class UsersController < ApplicationController
  

  def index
  end

  def new 
  end

  def create
    user=User.create(user_params)
    login(user)
    @user=current_user
    redirect_to user_path(@user)
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin)
    end
end
