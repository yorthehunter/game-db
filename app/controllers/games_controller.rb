class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.all
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(game_update_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    redirect_to games_path
  end

  private
    def game_params
      params.require(:game).permit(
          :purchase_date,
          :game_name,
          :game_alt_name,
          :system,
          :includes
      )
    end
    def game_update_params
      params.require(:game).permit(
          :game_name,
          :game_alt_name,
          :system,
          :includes
      )
    end

end
