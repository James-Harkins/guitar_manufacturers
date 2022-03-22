class CreateGuitars < ActiveRecord::Migration[5.2]
  def change
    create_table :guitars do |t|
      t.string :model_name
      t.integer :num_of_frets
      t.boolean :six_string
      t.integer :manufacturer_id
      t.timestamps
    end
  end
end
