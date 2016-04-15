class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user


  def take_ride
    @messages=[]
    can_afford
    tall_enough
    if @messages.empty?
      ride_my_pony
    else
      "Sorry. " << @messages.join(" ")
    end
  end
 

  def ride_my_pony
    rider.tickets -= ride.tickets
    rider.nausea += ride.nausea_rating
    rider.happiness += ride.happiness_rating 
    rider.save
  end

  def tall_enough
    ride.min_height <= rider.height ? @messages : @messages << "You are not tall enough to ride the #{ride.name}."
  end

  def can_afford
    rider.tickets >= ride.tickets ? @messages : @messages << "You do not have enough tickets to ride the #{ride.name}."
  end


  def rider
    self.user
  end

  def ride
    self.attraction
  end

end