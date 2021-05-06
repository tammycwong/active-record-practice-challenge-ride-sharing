class Passenger < ActiveRecord::Base
    has_many :rides
    has_many :drivers, through: :rides
    
    def car_list
      self.drivers.map {|driver| driver.car }.join(";")
      #Passenger.first.car_list
    end
    
    def average_rating
      self.rating
      #Passenger.first.average_rating
    end
    
    def self.average_rating
      self.all.average(:rating)
      #Passenger.all.average_rating
    end
    
    def self.worst_rated
      self.all.min_by {|passenger| passenger.rating }
      #Passenger.all.worst_rated
    end
    
    def self.worst_rating_in_existence
      self.worst_rated.rating
      #Passenger.worst_rated.rating
    end
   
end