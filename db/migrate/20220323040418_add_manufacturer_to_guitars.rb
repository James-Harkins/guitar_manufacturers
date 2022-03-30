class AddManufacturerToGuitars < ActiveRecord::Migration[5.2]
  def change
    add_reference :guitars, :manufacturer, foreign_key: true
  end
end
