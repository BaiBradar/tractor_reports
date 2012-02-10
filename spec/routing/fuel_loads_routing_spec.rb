require "spec_helper"

describe FuelLoadsController do
  describe "routing" do

    it "routes to #index" do
      get("/fuel_loads").should route_to("fuel_loads#index")
    end

    it "routes to #new" do
      get("/fuel_loads/new").should route_to("fuel_loads#new")
    end

    it "routes to #show" do
      get("/fuel_loads/1").should route_to("fuel_loads#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fuel_loads/1/edit").should route_to("fuel_loads#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fuel_loads").should route_to("fuel_loads#create")
    end

    it "routes to #update" do
      put("/fuel_loads/1").should route_to("fuel_loads#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fuel_loads/1").should route_to("fuel_loads#destroy", :id => "1")
    end

  end
end
