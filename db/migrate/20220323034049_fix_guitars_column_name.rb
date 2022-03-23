class FixGuitarsColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :guitars, :model_name, :model
  end
end
