class AttractionsController < ApplicationController
  before_action :set_attraction, except: [:index, :new, :create]

  def index
    @user=current_user
    @attractions=Attraction.all
  end

  def new
    redirect_to user_path, :alert=>"Only admins can do that" unless current_user.admin?
    @attraction=Attraction.new
  end

  def create
# binding.pry
    @attraction=Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    end
  end

  def show
    @user=current_user

  end

  def edit
  end

  def update
# binding.pry
    if @attraction.update(attraction_params)
      @user=current_user
      redirect_to attraction_path(@attraction)
    end
  end

  def ride
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

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

    def ride_params
      {attraction_id: @attraction.id, user_id: current_user.id}
    end

end
