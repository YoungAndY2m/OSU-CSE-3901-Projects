class AddStudentToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :student_id, :integer
  end
end
