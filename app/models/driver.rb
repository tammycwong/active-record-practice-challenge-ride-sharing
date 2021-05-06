class Driver < ActiveRecord::Base
    has_many :rides
    has_many :passengers, through: :rides
    
    def accept_ride_request(passenger, price, pick_up, drop_off)
      Ride.create(passenger_id: passenger.id, price: price, pick_up: pick_up, drop_off: drop_off)
    end
    
    def total_income
      self.rides.sum(:price)
      #Driver.first.total_income
    end
    
    def cancel_ride(passenger)
      self.rides.find_by(passenger_id: passenger.id).destroy
    end
    
    def self.most_active_driver
      self.all.filter{|driver| driver.rides.count}.max_by{|driver| driver.rides.count}
        #Driver.all.most_active_driver
    end
    
    def self.best_performing_driver
      self.all.max_by{|driver| driver.rating}
      #Driver.all.best_performing_driver
    end
   
end