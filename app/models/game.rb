class Game < ActiveRecord::Base
  validates :game_name,
            presence: true,
            length: { minimum: 3 }
end
