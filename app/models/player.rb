class Player < ActiveRecord::Base
  belongs_to :game
  has_many :kills
  
  validates_presence_of :game_id
  
  validate :validate_target
  
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
  
  private
    def validate_target
      Rails.logger.debug("****** target_valid?")
      if self.target.eql?(self)
        errors.add("target", "Cannot have self #{self.id}")
      elsif !self.target.nil? && self.target.target.eql?(self)
        errors.add("target", "Cannot have each other #{self.id}, #{self.target_id}")
      end
    end
end
