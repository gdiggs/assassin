module GamesHelper
  def display_player_tree
    first_player = @players.not_dead.first
    player = first_player
    target = player.target
    count = 0
    
    # do the first one
    player_string = "#{first_player.name} &rarr; #{target.name} "
    player = target
    target = player.target
    
    while !target.nil? && !player.eql?(first_player)
      player_string += "&rarr; #{target.name} "
      player = target
      target = player.target
    end
    
    return player_string
  end
end