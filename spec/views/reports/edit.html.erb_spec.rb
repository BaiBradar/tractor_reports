require 'spec_helper'

describe "reports/edit.html.erb" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :tractor_driver_name => "MyString",
      :tractor_code => "MyString",
      :deckers => 1.5,
      :operation_name => "MyString"
    ))
  end

  it "renders the edit report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reports_path(@report), :method => "post" do
      assert_select "input#report_tractor_driver_name", :name => "report[tractor_driver_name]"
      assert_select "input#report_tractor_code", :name => "report[tractor_code]"
      assert_select "input#report_deckers", :name => "report[deckers]"
      assert_select "input#report_operation_name", :name => "report[operation_name]"
    end
  end
end
