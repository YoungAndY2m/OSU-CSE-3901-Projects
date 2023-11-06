class RemoveTeamStudentFromEachTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :teams, :student_id
    remove_column :students, :team_id
  end
end
