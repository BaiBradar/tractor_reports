require 'spec_helper'

describe "reports/index.html.erb" do
  before(:each) do
    assign(:reports, [
      stub_model(Report,
        :tractor_driver_name => "Tractor Driver Name",
        :tractor_code => "Tractor Code",
        :deckers => 1.5,
        :operation_name => "Operation Name"
      ),
      stub_model(Report,
        :tractor_driver_name => "Tractor Driver Name",
        :tractor_code => "Tractor Code",
        :deckers => 1.5,
        :operation_name => "Operation Name"
      )
    ])
  end

  it "renders a list of reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tractor Driver Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tractor Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Operation Name".to_s, :count => 2
  end
end
