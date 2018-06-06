module Api
    module V1
        class EvaluacionController < ApplicationController
            def index
				evaluacion = Evaluacion.all
				render json: {result: true, message: 'todos las evaluaciones', data:evaluacion.to_json(:include => [:alumno, :curso])},status: :ok
			end
			
			def notacurso
				curso = Evaluacion.where('curso_id=? and alumno_id=?',params[:id], params[:idalum])
				render json: {result: true, message: 'detalle evaluacion curso', data:curso.as_json},status: :ok
                rescue ActiveRecord::RecordNotFound => err
                render json: {result: false, message: err.message}, status: :not_found
			end
            
            def show
				alumno = Evaluacion.where('alumno_id=?',params[:id])
				render json: {result: true, message: 'detalle evaluacion alumno', data:alumno.as_json(:include => [:alumno, :curso])},status: :ok
                rescue ActiveRecord::RecordNotFound => err
                render json: {result: false, message: err.message}, status: :not_found
			end
        end
    end
end