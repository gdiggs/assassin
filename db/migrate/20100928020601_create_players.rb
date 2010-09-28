class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :name
      t.integer :game_id
      t.boolean :dead, :default => false
      t.integer :target_id
      t.timestamps
    end
    add_index :players, :game_id
    add_index :players, :target_id
    add_index :players, :dead
  end

  def self.down
    remove_index :players, :game_id
    remove_index :players, :target_id
    remove_index :players, :dead
    remove_column :players, :game_id
    remove_column :players, :target_id
    remove_column :players, :dead
    drop_table :players
  end
end
