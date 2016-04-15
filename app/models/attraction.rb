class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides

  def riders
    self.users.count
  end
end
