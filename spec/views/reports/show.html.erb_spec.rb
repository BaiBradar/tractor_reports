require 'spec_helper'

describe "reports/show.html.erb" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :land_name => "Land Name",
      :tractor_driver_name => "Tractor Driver Name",
      :tractor_code => "Tractor Code",
      :operation_name => "Operation Name",
      :user_id => 1,
      :decker => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Land Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tractor Driver Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tractor Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Operation Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
