class CreateTractors < ActiveRecord::Migration
  def change
    create_table :tractors do |t|
      t.string :code
      t.float :current_fuel
      t.string :registration
      t.integer :user_id

      t.timestamps
    end
  end
end
