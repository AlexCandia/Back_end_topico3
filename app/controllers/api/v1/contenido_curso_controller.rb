module Api
    module V1
        class ContenidoCursoController < ApplicationController
            def index
				contenidocursos = ContenidoCurso.all
				render json: {status: 'SUCCESS', message: 'todos los cursos', data:contenidocursos.to_json(:include => [:contenido, :curso])},status: :ok
			end
			
			def show
				contenidocurso = Curso.find(params[:id])
				render json: {result: true, message: 'detalle Contenido', data: contenidocurso.as_json(:include => [:cxc])},status: :ok
                rescue ActiveRecord::RecordNotFound => err
                render json: {result: false, message: err.message}, status: :not_found
			end
        end
    end
end
