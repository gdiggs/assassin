class Game < ActiveRecord::Base
  has_many :players
  has_many :kills
  
  validates_presence_of :title
  
  # match players with their targets
  def match_players
    Resque.enqueue(MatchPlayersJob, self.id)
  end
end


# if killer == targets[killer]
#   puts "#{killer} has him/herself"
# elsif targets.index(killer) == target
#   puts "#{killer} has #{target} and #{target} has #{killer}"
# end