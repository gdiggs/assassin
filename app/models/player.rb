class Player < ActiveRecord::Base
  belongs_to :game
  has_many :kills
  
  validates_presence_of :game_id
  
  named_scope :not_dead, :conditions => { :dead => false }

  def dead?
    self.dead
  end
  
  def die!
    self.dead = true
    self.save!
  end
  
  def target
    if !target_id.nil?
      p = Player.find self.target_id
      if p.dead?
        p = p.target
      end
      p
    else
      nil
    end
  end
end
