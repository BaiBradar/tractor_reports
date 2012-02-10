class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :tractor_driver_name
      t.string :tractor_code
      t.float :deckers
      t.string :operation_name
      t.date :date

      t.timestamps
    end
  end
end
