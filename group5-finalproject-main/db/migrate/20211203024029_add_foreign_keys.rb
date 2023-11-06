class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_reference(:teams, :presentation_event)
    add_reference(:evaluations, :student)
    add_reference(:evaluations, :team)
  end
end
