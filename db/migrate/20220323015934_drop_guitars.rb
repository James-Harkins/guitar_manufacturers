class DropGuitars < ActiveRecord::Migration[5.2]
  def change
    drop_table :guitars
  end
end
