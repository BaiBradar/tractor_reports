require 'spec_helper'

describe "fuel_loads/show.html.erb" do
  before(:each) do
    @fuel_load = assign(:fuel_load, stub_model(FuelLoad,
      :amount => 1.5,
      :tractor_id => 1,
      :tractor_driver_id => 1,
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
