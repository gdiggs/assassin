class GamesController < ApplicationController
  def new
  end
  
  def show
    @game = Game.find params[:id]
    @players = @game.players
    @kills = @game.kills
  end
end