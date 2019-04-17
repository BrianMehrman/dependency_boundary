class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.string :name
      t.integer :bicycle_id
      t.integer :sprocket_count
      t.boolean :cog
      t.boolean :chainring

      t.timestamps null: false
    end
  end
end
