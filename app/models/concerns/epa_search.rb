module EPASearch
  extend ActiveSupport::Concern

  attr_writer :epa_vehicle
  
  SEARCH_BY_MAKE = "http://www.fueleconomy.gov/ws/rest/vehicle/menu/make?"
  OPTIONS_SEARCH = "http://www.fueleconomy.gov/ws/rest/vehicle/menu/options?"
  VEHICLE_SEARCH = "http://www.fueleconomy.gov/ws/rest/vehicle/"
  
  module InstanceMethods
        
    def epa_search_by_model(args ={}) 
      # Returns a hash of years(1982-current), makes, and models avail during those years
      
      question = URI.encode_www_form("year"=> args["year"], "make"=> args["make"], "model"=> args["model"])
      final = SEARCH_BY_MAKE + question
      result = HTTParty.get(final)
      car_hash = result.parsed_response["vehicle"]
      car_hash
    end
   
   
   def epa_search_options(args={}) 
     # Returns a hash of option packages (engine/trans) and ID for each selection
     
     question = URI.encode_www_form("year"=> args["year"], "make"=> args["make"], "model"=> args["model"])
     final = OPTIONS_SEARCH + question
     result = HTTParty.get(final)
     options_hash = result.parsed_response["menuItems"]
     options_hash
   end
   
   def epa_vehicle_by_id(vehicle_id)
     # Returns an OpenStruct object of data on an individual car from the EPA (with dot notation)
     
     result = HTTParty.get(VEHICLE_SEARCH + vehicle_id.to_s)
     car_hash = result.parsed_response["vehicle"]
     OpenStruct.new(car_hash)
   end
    
  end
  
  module ClassMethods
    
    def import_car_from_epa(vehicle)
      # Expects an OpenStruct object to create a Car object
      car = Car.new(epa_vehicle: vehicle)
      car.epa_id = vehicle.id
      car.make = vehicle.make
      car.model = vehicle.model
      car.year = vehicle.year
      car.drive = vehicle.drive
      car.trany = vehicle.trany
      car.s_charger = vehicle.sCharger == 'S' ? true : false
      car.t_charger = vehicle.tCharger == 'T' ? true : false
      car.displ = vehicle.displ.to_f
      car.cylinders = vehicle.cylinders.to_i
      
      return car
    end
  end

end