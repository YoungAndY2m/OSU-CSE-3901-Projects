class AddPresentationEventNameToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :presentation_event_name, :string
  end
end
