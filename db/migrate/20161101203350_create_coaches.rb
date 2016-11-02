class CreateCoaches < ActiveRecord::Migration[5.0]
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :user_name
      t.string :password_digest
      t.integer :team_id
    end
  end
end
