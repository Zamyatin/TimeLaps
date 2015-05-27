require 'rails_helper'

RSpec.describe "garages/new", type: :view do
  before(:each) do
    assign(:garage, Garage.new())
  end

  it "renders new garage form" do
    render

    assert_select "form[action=?][method=?]", garages_path, "post" do
    end
  end
end
