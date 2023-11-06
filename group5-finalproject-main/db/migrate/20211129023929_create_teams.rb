class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :teamName
      t.string :presentationEvent

      t.timestamps
    end
  end
end
