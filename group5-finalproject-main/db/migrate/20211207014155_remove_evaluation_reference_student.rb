class RemoveEvaluationReferenceStudent < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:evaluations, :student)
  end
end
