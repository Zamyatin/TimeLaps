require 'rails_helper'

RSpec.describe "garages/edit", type: :view do
  before(:each) do
    @garage = assign(:garage, Garage.create!())
  end

  it "renders the edit garage form" do
    render

    assert_select "form[action=?][method=?]", garage_path(@garage), "post" do
    end
  end
end
