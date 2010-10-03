class GamesController < ApplicationController
  def create
    game = Game.new(:title => params[:game][:title])
    game.save!

    params[:game][:players].each do |player|
      p = Player.new(:name => player[1][:name], :game_id => game.id)
      p.save!
    end

    render :json => { :url => game_url(game) }
  end

  def new
  end

  def show
    @game = Game.find params[:id]
    @players = @game.players
    @kills = @game.kills
  end
end