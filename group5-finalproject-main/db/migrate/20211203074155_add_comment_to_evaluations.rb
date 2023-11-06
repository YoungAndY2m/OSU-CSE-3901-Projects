class AddCommentToEvaluations < ActiveRecord::Migration[6.0]
  def change
    add_column :evaluations, :comments, :string
  end
end
