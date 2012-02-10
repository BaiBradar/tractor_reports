require 'spec_helper'

describe "FuelLoads" do
  describe "GET /fuel_loads" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get fuel_loads_path
      response.status.should be(200)
    end
  end
end
