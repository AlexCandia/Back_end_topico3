class CreateProfesorCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :profesor_cursos do |t|
      t.references :profesor, foreign_key: true
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
