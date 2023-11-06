class AddTeamToStudent < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :team_id, :integer
  end
end
