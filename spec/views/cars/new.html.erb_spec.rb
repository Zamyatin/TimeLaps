require 'rails_helper'

RSpec.describe "cars/new", type: :view do
  before(:each) do
    assign(:car, Car.new())
  end

  it "renders new car form" do
    render

    assert_select "form[action=?][method=?]", cars_path, "post" do
    end
  end
end
