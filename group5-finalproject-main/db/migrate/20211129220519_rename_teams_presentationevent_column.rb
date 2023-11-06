class RenameTeamsPresentationeventColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :teams, :presentationEvent, :presentation_event
  end
end
