module Api
    module V1
        class EvaluacionController < ApplicationController
            def index
				evaluacion = Evaluacion.all
				render json: {status: 'SUCCESS', message: 'todos las evaluaciones', data:evaluacion.to_json(:include => [:alumno, :curso])},status: :ok
			end
			
			def notacurso
				curso = Evaluacion.where('curso_id=?',params[:id])
				render json: {status: 'SUCCESS', message: 'detalle evaluacion curso', data:curso.to_json(:include => [:alumno, :curso])},status: :ok
                rescue ActiveRecord::RecordNotFound => err
                render json: { message: err.message}, status: :not_found
			end
            
            def show
				alumno = Evaluacion.where('alumno_id=?',params[:id])
				render json: {status: 'SUCCESS', message: 'detalle evaluacion alumno', data:alumno.to_json(:include => [:alumno, :curso])},status: :ok
                rescue ActiveRecord::RecordNotFound => err
                render json: { message: err.message}, status: :not_found
			end
        end
    end
end