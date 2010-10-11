class Game < ActiveRecord::Base
  has_many :players
  has_many :kills
  
  validates_presence_of :title
  
  # match players with their targets
  def match_players
    targets = self.players.shuffle
    Rails.logger.debug("****** MATCHING #{self.players.count} PLAYERS")
    Rails.logger.debug("****** Targets:")
    targets.each_with_index do |t, i|
      self.players[i].target_id = t.id
      self.players[i].save!
    end
    
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.debug("**** k, error, #{e}")
      self.match_players && return
  end
end


# if killer == targets[killer]
#   puts "#{killer} has him/herself"
# elsif targets.index(killer) == target
#   puts "#{killer} has #{target} and #{target} has #{killer}"
# end