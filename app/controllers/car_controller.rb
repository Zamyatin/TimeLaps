class CarController < ApplicationController

  def index
    @cars = Cars.all
  end

  def create
    car = Car.epa_vehicle_by_id(id: params[:epa_id])
    new_car = Car.import_car_from_epa(car)
    if new_car.save
      render "show"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
