module EPASearch
  extend ActiveSupport::Concern

  attr_writer :epa_vehicle

  module InstanceMethods

    def epa_year_listing
      response = HTTParty.get('http://www.fueleconomy.gov/ws/rest/vehicle/menu/year')
      @years = response.parsed_response['menuItems'].to_json
    end
    
    def epa_make_listing(year)
      response = HTTParty.get("http://www.fueleconomy.gov/ws/rest/vehicle/menu/make?year=#{year}")
      @makes = response.parsed_response['menuItems'].to_json
    end
    
    def epa_model_listings(year, make)
      response = HTTParty.get("http://www.fueleconomy.gov/ws/rest/vehicle/menu/model?year=#{year}&make=#{make}")
      @models = response.parsed_response['menuItems'].to_json
    end
    
    def epa_model_options(year, make, model)
      response =  HTTParty.get("http://www.fueleconomy.gov/ws/rest/vehicle/menu/options?year=#{year}&make=#{make}&model=#{model}")
      @car_with_options = response.parsed_response['menuItems'].to_json
    end
    
    def epa_vehicle_by_id(id)
      response = HTTParty.get("http://www.fueleconomy.gov/ws/rest/vehicle/#{id}")
      @vehicle = response.parsed_response['vehicle'].to_json
    end

   #
   #
   #
   #
   #  def epa_search_by_model(args ={})
   #    # Returns a hash of years(1982-current), makes, and models avail during those years
   #
   #    question = URI.encode_www_form("year"=> args["year"], "make"=> args["make"], "model"=> args["model"])
   #    final = SEARCH_BY_MAKE + question
   #    result = HTTParty.get(final)
   #    car_hash = result.parsed_response["vehicle"]
   #    car_hash
   #  end
   #
   # def epa_search_options(args={})
   #   # Returns a hash of option packages (engine/trans) and ID for each selection
   #
   #   question = URI.encode_www_form("year"=> args["year"], "make"=> args["make"], "model"=> args["model"])
   #   final = OPTIONS_SEARCH + question
   #   result = HTTParty.get(final)
   #   options_hash = result.parsed_response["menuItems"]
   #   options_hash
   # end
   #
   # def epa_vehicle_by_id(vehicle_id)
   #   # Returns an OpenStruct object of data on an individual car from the EPA (with dot notation)
   #
   #   result = HTTParty.get(VEHICLE_SEARCH + vehicle_id.to_s)
   #   car_hash = result.parsed_response["vehicle"]
   #   car = OpenStruct.new(car_hash)
   #   return car
   # end

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
