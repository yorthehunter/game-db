class Game < ActiveRecord::Base
  validates :game_name,
            presence: true,
            length: { minimum: 3 }

  def as_json(options={})
    {:game_name => self.game_name}
  end

end