class Game < ActiveRecord::Base
  has_many :players
  has_many :kills
  
  validates_presence_of :title
end
