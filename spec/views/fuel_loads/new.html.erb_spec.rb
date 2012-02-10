require 'spec_helper'

describe "fuel_loads/new.html.erb" do
  before(:each) do
    assign(:fuel_load, stub_model(FuelLoad,
      :amount => 1.5,
      :tractor_id => 1,
      :tractor_driver_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new fuel_load form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fuel_loads_path, :method => "post" do
      assert_select "input#fuel_load_amount", :name => "fuel_load[amount]"
      assert_select "input#fuel_load_tractor_id", :name => "fuel_load[tractor_id]"
      assert_select "input#fuel_load_tractor_driver_id", :name => "fuel_load[tractor_driver_id]"
      assert_select "input#fuel_load_user_id", :name => "fuel_load[user_id]"
    end
  end
end
