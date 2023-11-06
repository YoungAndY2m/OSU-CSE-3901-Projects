class AddEvaluationReferenceStudent < ActiveRecord::Migration[6.0]
  def change
    add_reference(:evaluations, :student)
  end
end
