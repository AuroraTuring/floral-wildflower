class ChangeCostToFloat < ActiveRecord::Migration[7.1]
  def change
    change_column :ingredients, :cost, :float
  end
end
