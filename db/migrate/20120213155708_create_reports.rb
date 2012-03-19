class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :land_name
      t.string :tractor_driver_name
      t.string :tractor_code
      t.string :operation_name
      t.integer :user_id
      t.integer :decker
      t.date :date

      t.timestamps
    end
  end
end
