class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :age
      t.integer :depth
      t.integer :team_id
    end
  end
end
