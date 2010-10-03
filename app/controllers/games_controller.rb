class GamesController < ApplicationController
  def show
    @game = Game.find params[:id]
    @players = @game.players
  end
end