require 'spec_helper'

describe "reports/show.html.erb" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :tractor_driver_name => "Tractor Driver Name",
      :tractor_code => "Tractor Code",
      :deckers => 1.5,
      :operation_name => "Operation Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tractor Driver Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tractor Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Operation Name/)
  end
end
