class CreateBicycles < ActiveRecord::Migration
  def change
    create_table :bicycles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
