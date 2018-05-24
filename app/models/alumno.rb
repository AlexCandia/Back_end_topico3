class Alumno < ApplicationRecord
    has_many :alumno_cursos
    has_many :axc, through: :alumno_cursos, source: :curso
    has_many :evaluacions
end
