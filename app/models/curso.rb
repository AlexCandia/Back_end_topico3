class Curso < ApplicationRecord
    has_many :profesor_cursos
    has_many :cxp, through: :profesor_cursos, source: :profesor
    has_many :alumno_cursos
    has_many :cxa, through: :alumno_cursos, source: :alumno
    has_many :evaluacions
    has_many :contenido_cursos
    has_many :cxc, through: :contenido_cursos, source: :contenido
end
