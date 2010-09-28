class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :title
      t.boolean :over, :default => false
      t.timestamps
    end
    
    add_index :games, :title
    add_index :games, :over
  end

  def self.down
    remove_index :games, :title
    remove_index :games, :over
    drop_table :games
  end
end
