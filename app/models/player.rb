class Player < ActiveRecord::Base
  belongs_to :game
  has_many :kills
  
  validates_presence_of :game_id

  def dead?
    self.dead
  end
  
  def die!
    self.dead = true
    self.target_id = nil
    self.save!
  end
  
  def target
    if !target_id.nil?
      Player.find self.target_id
    else
      nil
    end
  end
end
