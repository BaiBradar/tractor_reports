class CreateFuelLoads < ActiveRecord::Migration
  def change
    create_table :fuel_loads do |t|
      t.float :amount
      t.datetime :loaded_at
      t.integer :tractor_id
      t.integer :tractor_driver_id
      t.integer :user_id

      t.timestamps
    end
  end
end
