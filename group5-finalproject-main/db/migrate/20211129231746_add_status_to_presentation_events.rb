class AddStatusToPresentationEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :presentation_events, :status, :string
  end
end
