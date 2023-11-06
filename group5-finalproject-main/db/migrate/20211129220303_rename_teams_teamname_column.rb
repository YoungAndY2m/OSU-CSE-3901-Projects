class RenameTeamsTeamnameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :teams, :teamName, :team_name
  end
end
