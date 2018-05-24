class CreateContenidoCursos < ActiveRecord::Migration[5.0]
  def change
    create_table :contenido_cursos do |t|
      t.references :contenido, foreign_key: true
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
