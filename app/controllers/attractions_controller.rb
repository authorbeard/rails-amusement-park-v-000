class AttractionsController < ApplicationController
  before_action :set_attraction, except: [:index, :new, :create]
  before_action :set_user


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

    if @attraction.update(attraction_params)
      @user=current_user
      redirect_to attraction_path(@attraction)
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

end
