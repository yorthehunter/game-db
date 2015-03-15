module GamesHelper

  def disabled(action)
    params[:action] == action ? "disabled" : false
  end

  def search_link(game)
    name = game.game_alt_name ? game.game_alt_name : game.game_name
    "http://videogames.pricecharting.com/search?q=#{name}&type=videogames&go=Go"
  end

end
