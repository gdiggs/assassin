class CreateKills < ActiveRecord::Migration
  def self.up
    create_table :kills do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :killer_id
      t.timestamps
    end
    add_index :kills, :game_id
    add_index :kills, :player_id
    add_index :kills, :killer_id
  end

  def self.down
    remove_index :kills, :game_id
    remove_index :kills, :player_id
    remove_index :kills, :killer_id
    remove_column :kills, :game_id
    remove_column :kills, :player_id
    remove_column :kills, :killer_id
    drop_table :kills
  end
end
