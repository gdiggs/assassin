class GamesController < ApplicationController
  def show
    @game = Game.find params[:id]
    @players = @game.players
    @kills = @game.kills
  end
end