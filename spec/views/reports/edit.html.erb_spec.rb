require 'spec_helper'

describe "reports/edit.html.erb" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :land_name => "MyString",
      :tractor_driver_name => "MyString",
      :tractor_code => "MyString",
      :operation_name => "MyString",
      :user_id => 1,
      :decker => 1
    ))
  end

  it "renders the edit report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reports_path(@report), :method => "post" do
      assert_select "input#report_land_name", :name => "report[land_name]"
      assert_select "input#report_tractor_driver_name", :name => "report[tractor_driver_name]"
      assert_select "input#report_tractor_code", :name => "report[tractor_code]"
      assert_select "input#report_operation_name", :name => "report[operation_name]"
      assert_select "input#report_user_id", :name => "report[user_id]"
      assert_select "input#report_decker", :name => "report[decker]"
    end
  end
end
