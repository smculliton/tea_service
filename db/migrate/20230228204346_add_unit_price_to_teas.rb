class AddUnitPriceToTeas < ActiveRecord::Migration[5.2]
  def change
    add_column :teas, :unit_price, :integer
  end
end
