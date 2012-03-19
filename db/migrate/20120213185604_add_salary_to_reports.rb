class AddSalaryToReports < ActiveRecord::Migration
  def change
    add_column :reports, :salary, :float
  end
end
