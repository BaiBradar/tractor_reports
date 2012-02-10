require 'spec_helper'

describe "fuel_loads/index.html.erb" do
  before(:each) do
    assign(:fuel_loads, [
      stub_model(FuelLoad,
        :amount => 1.5,
        :tractor_id => 1,
        :tractor_driver_id => 1,
        :user_id => 1
      ),
      stub_model(FuelLoad,
        :amount => 1.5,
        :tractor_id => 1,
        :tractor_driver_id => 1,
        :user_id => 1
      )
    ])
  end

  it "renders a list of fuel_loads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
