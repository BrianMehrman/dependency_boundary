class CreateWheels < ActiveRecord::Migration
  def change
    create_table :wheels do |t|
      t.string :name
      t.integer :bicycle_id
      t.string :type
      t.float :rim
      t.float :tire

      t.timestamps null: false
    end
  end
end
