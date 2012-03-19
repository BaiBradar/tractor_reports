class AddApproximateFuelCostToReports < ActiveRecord::Migration
  def change
    add_column :reports, :approximate_fuel_cost, :float
  end
end
