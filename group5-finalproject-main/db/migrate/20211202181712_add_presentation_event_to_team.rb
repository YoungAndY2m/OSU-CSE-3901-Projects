class AddPresentationEventToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :presentation_event, :string
  end
end
