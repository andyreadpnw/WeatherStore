class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :weather_type
      t.string :image_name

      t.timestamps
    end
  end
end
