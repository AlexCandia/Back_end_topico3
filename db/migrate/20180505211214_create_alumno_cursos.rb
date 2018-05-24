class CreateAlumnoCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :alumno_cursos do |t|
      t.references :alumno, foreign_key: true
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
