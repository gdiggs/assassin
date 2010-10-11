class MatchPlayersJob
  @queue = :players

  def self.perform(game_id)
    game = Game.find game_id
    players = game.players
    Rails.logger.debug("***** Started Match job for #{game.title} (#{game.id})")
    
    targets = players.shuffle
    Rails.logger.debug("****** MATCHING #{players.count} PLAYERS")
    Rails.logger.debug("****** Targets:")
    targets.each_with_index do |t, i|
      players[i].target_id = t.id
      players[i].save!
    end
    
    # if we're here, game is all good
    game.matched = true
    game.save!
    
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.debug("**** k, error, #{e}")
      perform(game_id) && return
    
  end
end