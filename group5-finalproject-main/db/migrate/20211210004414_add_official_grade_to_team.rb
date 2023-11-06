class AddOfficialGradeToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :grade, :integer
  end
end
