class CreateTractorDrivers < ActiveRecord::Migration
  def change
    create_table :tractor_drivers do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
