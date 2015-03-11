class AddNotAvailableToGames < ActiveRecord::Migration
  def change
    add_column :games, :not_available, :bool
  end
end
