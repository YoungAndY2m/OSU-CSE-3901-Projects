class AddCommentToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :comment, :string
  end
end
