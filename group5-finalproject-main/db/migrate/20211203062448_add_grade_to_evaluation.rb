class AddGradeToEvaluation < ActiveRecord::Migration[6.0]
  def change
    add_column :evaluations, :grade, :decimal, precision: 5, scale: 2, default: "0.0"
  end
end
