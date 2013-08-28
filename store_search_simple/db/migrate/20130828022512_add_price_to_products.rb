class AddPriceToProducts < ActiveRecord::Migration
  def change
  	add_collumn :products, :price, :decimal
  end
end
