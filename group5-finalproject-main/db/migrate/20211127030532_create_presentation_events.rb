class CreatePresentationEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :presentation_events do |t|
      t.string :event_name

      t.timestamps
    end
  end
end
