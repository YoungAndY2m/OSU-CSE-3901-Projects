class AddDueToPresentationEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :presentation_events, :due, :timestamptz
  end
end
