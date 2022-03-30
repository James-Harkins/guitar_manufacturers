class CreateManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :headquarter_city
      t.integer :years_in_business
      t.boolean :custom_shop
      t.timestamps
    end
  end
end
