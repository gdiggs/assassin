class Game < ActiveRecord::Base
  has_many :players
  has_many :kills
  
  validates_presence_of :title
  
  # match players with their targets
  def match_players
    Resque.enqueue(MatchPlayersJob, self.id) unless self.matched?
  end
  
  def matched?
    !!self.matched
  end
end