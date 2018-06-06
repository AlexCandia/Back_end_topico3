module Api
    module V1
        class ProfesorCursoController < ApplicationController
            def index
				profesorcursos = ProfesorCurso.all
				render json: {result: true, message: 'todos los cursos', data:profesorcursos.to_json(:include => [:curso, :profesor])},status: :ok
			end
			
			def show
				profesorcurso = Profesor.find(params[:id])
				render json: {result: true, message: 'Listados de Cursos', data:profesorcurso.as_json(:include => [:pxc])},status: :ok
                rescue ActiveRecord::RecordNotFound => err
                render json: {result: false, message: err.message}, status: :not_found
			end
        end
    end
end
