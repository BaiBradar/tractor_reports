class CreateGetReports < ActiveRecord::Migration
  def change
    create_table :get_reports do |t|

      t.timestamps
    end
  end
end
