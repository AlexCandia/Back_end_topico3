class CreateEvaluacions < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluacions do |t|
      t.references :alumno, foreign_key: true
      t.references :curso, foreign_key: true
      t.integer :nota

      t.timestamps
    end
  end
end
