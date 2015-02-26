class Game < ActiveRecord::Base
  validates :game_name,
            presence: true,
            length: { minimum: 3 }

  has_attachments :photos, maximum: 5, accept: [:jpg, :jpeg, :png, :gif]

  def as_json(options={})
    {:game_name => self.game_name}
  end

end