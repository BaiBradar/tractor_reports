class CreateLands < ActiveRecord::Migration
  def change
    create_table :lands do |t|
      t.string :name
      t.string :region
      t.integer :user_id

      t.timestamps
    end
  end
end
