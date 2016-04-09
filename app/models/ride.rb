class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  validates_presence_of :attraction, :user
end



=begin
  def take_ride
    #controller action creates a ride object from params
    #calls this method on that object
    #tix: self.attraction.tickets, self.user.tickets
    #1. first checks tix
    #2. checks height
    #3. makes updates
    #4. return value: message or ?

  end
=end