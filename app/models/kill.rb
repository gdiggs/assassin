class Kill < ActiveRecord::Base
  belongs_to :game
  belongs_to :player
  
  def kill!(player_id, target_id)
    p = Player.find player_id
    t = Player.find target_id    

    self.target_id = target_id
    self.game_id = p.game_id
    self.player_id = player_id
    
    t.die!
    
    t.save!
    self.save!
  end
  
  def target
    Player.find self.target_id
  end
end
