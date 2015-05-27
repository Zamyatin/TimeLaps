require 'rails_helper'

RSpec.describe "garages/show", type: :view do
  before(:each) do
    @garage = assign(:garage, Garage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
