class Ride < ActiveRecord::Base
    belongs_to :passenger
    belongs_to :driver
    
    def print_details #won't test?
      puts "#{self.driver.name} drove #{self.passenger.name} for #{self.price} from #{self.pick_up} to #{self.drop_off}"
    end
end