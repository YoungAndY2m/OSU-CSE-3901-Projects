class AddDueDateToPresentationEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :presentation_events, :due_date, :date
  end
end
