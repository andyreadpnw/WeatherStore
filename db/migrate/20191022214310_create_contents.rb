class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :name
      t.string :image_name
      t.string :weather_type

      t.timestamps
    end
  end
end
