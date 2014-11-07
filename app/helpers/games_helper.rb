module GamesHelper

  def disabled(action)
    params[:action] == action ? "disabled" : false
  end

end
