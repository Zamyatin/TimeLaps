require 'rails_helper'

RSpec.describe "cars/show", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
