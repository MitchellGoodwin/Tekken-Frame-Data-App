class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.integer :character_id
      t.string :command
      t.string :level
      t.string :damage
      t.string :startup
      t.string :block
      t.string :hit
      t.string :ch
      t.string :notes

      t.timestamps
    end
  end
end
