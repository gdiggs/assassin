class MoveKillerToTarget < ActiveRecord::Migration
  def self.up
    remove_column :kills, :killer_id
    add_column :kills, :target_id, :integer
    add_index :kills, :target_id
  end

  def self.down
    remove_index :kills, :target_id
    remove_column :kills, :target_id
    add_column :kills, :killer_id, :integer
  end
end
