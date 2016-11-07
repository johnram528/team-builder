class RemoveCoachIdTeams < ActiveRecord::Migration[5.0]
  def change
     remove_column(:teams, :coach_id)
  end
end
