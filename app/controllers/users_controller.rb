class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new]

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
  end

  def destroy

  end



  private

    def set_user
      @user=current_user
    end

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin)
    end
end
