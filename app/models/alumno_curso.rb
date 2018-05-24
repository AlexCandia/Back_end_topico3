class AlumnoCurso < ApplicationRecord
  belongs_to :alumno
  belongs_to :curso
end
