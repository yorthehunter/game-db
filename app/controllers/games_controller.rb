class GamesController < ApplicationController
  before_filter :authenticate, only: [:index, :new, :create, :edit, :update, :show, :destroy, :activate]
  helper_method :sort_column, :sort_direction

  # @bomb = GiantBomb::API.key(ENV["GIANTBOMB_KEY"])

  layout false, only: [:edit, :new, :show]


  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:success] = "Successfully added <strong>#{@game.game_name}</strong> to the database!".html_safe
      redirect_to action: "index"
    else
      flash[:alert] = "Couldn't create game: #{@game.errors.full_messages.join(', ')}"
      redirect_to action: "index"
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def readonly
    @games = Game.order(sort_column + " " + sort_direction)
  end

  def index
    @games = Game.order(sort_column + " " + sort_direction)

    # render :json => Game.all
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(game_params)
      flash[:success] = "Successfully edited <strong>#{@game.game_name}</strong>.".html_safe
      redirect_to action: "index"
    else
      flash[:alert] = "Couldn't edit game: #{@game.errors.full_messages.join(', ')}"
      redirect_to action: "index"
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    flash[:info] = "<strong>#{@game.game_name}</strong> was successfully removed.".html_safe
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
          :includes,
          :not_available,
          photos: []
      )
    end

    def sort_column
      Game.column_names.include?(params[:sort]) ? params[:sort] : "game_name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
