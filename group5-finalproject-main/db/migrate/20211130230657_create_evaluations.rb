class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.boolean :attempt

      t.timestamps
    end
  end
end
