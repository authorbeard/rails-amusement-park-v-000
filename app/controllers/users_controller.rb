class UsersController < ApplicationController
  before_action :set_user, except: [:new, :create]
  

  def index
  end

  def ride
    attraction=Attraction.find_by(id: params[:id])
    ride=Ride.new(ride_params)
    if ride.save!
      ridden = ride.take_ride
      if ridden == true
        redirect_to user_path(current_user), :notice=>"Thanks for riding the #{attraction.name}!" 
      else
        redirect_to user_path(current_user), :alert=>"#{ridden}"
      end
    end
  end

  def new 
    @user=User.new
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

    def ride_params
      {attraction_id: params[:id], user_id: current_user.id}
    end
end
