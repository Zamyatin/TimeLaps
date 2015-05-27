require 'rails_helper'

RSpec.describe "garages/index", type: :view do
  before(:each) do
    assign(:garages, [
      Garage.create!(),
      Garage.create!()
    ])
  end

  it "renders a list of garages" do
    render
  end
end
