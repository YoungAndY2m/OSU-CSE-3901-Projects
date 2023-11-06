class RemovePresentationFromTeams < ActiveRecord::Migration[6.0]
  def change
    remove_column :teams, :presentation_event
  end
end
