class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :name
      t.float :price_dk
      t.float :fuel_dk
      t.integer :user_id

      t.timestamps
    end
  end
end
