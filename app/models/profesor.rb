class Profesor < ApplicationRecord
    has_many :profesor_cursos
    
    has_many :pxc, through: :profesor_cursos, source: :curso
    #has_and_belongs_to_many :curso
end
