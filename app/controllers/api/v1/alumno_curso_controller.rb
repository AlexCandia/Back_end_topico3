module Api
    module V1
        class AlumnoCursoController < ApplicationController
            def index
				alumnocursos = AlumnoCurso.all
				render json: {result: true, message: 'todos los cursos', data:alumnocursos.to_json(:include => [:alumno, :curso])},status: :ok
			end
			
			def show
				alumnocurso = Alumno.find(params[:id])
				render json: {result: true, message: 'Listados de Cursos', data:alumnocurso.as_json(:include => [:axc])},status: :ok
                rescue ActiveRecord::RecordNotFound => err
                render json: {result: false, message: err.message}, status: :not_found
			end
        end
    end
end
