class AddMatchedToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :matched, :boolean, :default => false
    add_index :games, :matched
  end

  def self.down
    remove_index :games, :matched
    remove_column :games, :matched
  end
end
