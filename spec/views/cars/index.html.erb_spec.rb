require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(),
      Car.create!()
    ])
  end

  it "renders a list of cars" do
    render
  end
end
