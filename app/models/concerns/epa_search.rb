module EPASearch
  extend ActiveSupport::Concern

  attr_writer :epa_vehicle

  module InstanceMethods

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
      vehicle_hash = response.parsed_response['vehicle']
      epa_car = OpenStruct.new(vehicle_hash)
      return epa_car
    end
    
  end

end
