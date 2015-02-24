class GamesController < ApplicationController
  before_filter :authenticate, only: [:index, :new, :create, :edit, :update, :show, :destroy]

  # @bomb = GiantBomb::API.key(ENV["GIANTBOMB_KEY"])

  layout false, only: [:edit, :new]


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

  def readonly
    @games = Game.all
  end

  def index
    @games = Game.all

    # render :json => Game.all
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(game_update_params)
      redirect_to action: "index"
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    redirect_to games_path
  end

  protected
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["AUTH_USERNAME"] && password == ENV["AUTH_PASSWORD"]
      end
    end

  private
    def game_params
      params.require(:game).permit(
          :purchase_date,
          :game_name,
          :game_alt_name,
          :system,
          :purchase_price,
          :includes
      )
    end
    def game_update_params
      params.require(:game).permit(
          :game_name,
          :game_alt_name,
          :system,
          :purchase_price,
          :includes
      )
    end

end
