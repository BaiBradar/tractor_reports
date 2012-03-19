require 'spec_helper'

describe "reports/index.html.erb" do
  before(:each) do
    assign(:reports, [
      stub_model(Report,
        :land_name => "Land Name",
        :tractor_driver_name => "Tractor Driver Name",
        :tractor_code => "Tractor Code",
        :operation_name => "Operation Name",
        :user_id => 1,
        :decker => 1
      ),
      stub_model(Report,
        :land_name => "Land Name",
        :tractor_driver_name => "Tractor Driver Name",
        :tractor_code => "Tractor Code",
        :operation_name => "Operation Name",
        :user_id => 1,
        :decker => 1
      )
    ])
  end

  it "renders a list of reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Land Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tractor Driver Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tractor Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Operation Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
