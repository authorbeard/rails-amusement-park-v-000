class AttractionsController < ApplicationController
  before_action :set_attraction, except: [:index, :new]

  def index
    @user=@current_user
    @attractions=Attraction.all
  end

  def new
  end

  def create
  end

  def show

  end

  def edit
  end

  def update
  end

  def ride
# binding.pry
    ride=Ride.new(ride_params)
    if ride.save!
      ride.take_ride
      redirect_to user_path(current_user)
    end
  end

  def destroy
  end



  private

    def set_attraction
      @attraction=Attraction.find_by(id: params[:id])
    end

    def ride_params
      {attraction_id: @attraction.id, user_id: current_user.id}
    end

end
