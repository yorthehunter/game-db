class AddPurchasePriceToGames < ActiveRecord::Migration
  def change
    add_column :games, :purchase_price, :string
  end
end
