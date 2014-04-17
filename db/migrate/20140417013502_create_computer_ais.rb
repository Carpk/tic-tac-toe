class CreateComputerAis < ActiveRecord::Migration
  def change
    create_table :computer_ais do |t|
      t.integer :wins
      t.integer :ties
      t.integer :losses
      t.integer :total
      
      t.timestamps
    end
  end
end
