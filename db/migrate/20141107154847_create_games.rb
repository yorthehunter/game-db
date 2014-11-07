class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :purchase_date
      t.string :game_name
      t.string :game_alt_name
      t.string :system
      t.string :includes

      t.timestamps
    end
  end
end
