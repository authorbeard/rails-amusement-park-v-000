class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  NO_DICE = [
              "You are not tall enough", 
              "You do not have enough tickets"
             ]
  

  def take_ride
    @messages=[]
    can_afford
    tall_enough
    if @messages.empty?
      ride_my_pony
    else
      "Sorry. #{@messages.join(" ")}"
    end
  end
 

  def ride_my_pony
    rider.tickets -= ride.tickets
    rider.nausea += ride.nausea_rating
    rider.happiness += ride.happiness_rating 
    rider.save
  end

  def tall_enough
    ride.min_height < rider.height ? @messages : @messages << "#{NO_DICE[0]} to ride the #{ride.name}."
  end

  def can_afford
    rider.tickets - ride.tickets >= 0 ? @messages : @messages << "#{NO_DICE[1]} to ride the #{ride.name}."
  end


  def rider
    self.user
  end

  def ride
    self.attraction
  end

end



=begin
  def take_ride
    #controller action creates a ride object from params
    #calls this method on that object
    #tix: attraction.tickets, self.user.tickets
    #1. first checks tix
    #2. checks height
    #3. makes updates
    #4. return value: message or ?

  end
=end