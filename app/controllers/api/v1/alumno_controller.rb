module Api
    module V1
        class AlumnoController < ApplicationController
                                    
            def index
                @Alumno = Alumno.all
                render json: {result: true, message: 'todos los alumnos', data:@Alumno},status: :ok
            end
			
			def show
				alumno = Alumno.find(params[:id])
				render json: {status: 'SUCCESS', message: 'detalle Alumno', data:alumno},status: :ok
                rescue ActiveRecord::RecordNotFound => err
            render json: { message: err.message}, status: :not_found
			end
            
            def create
                if Alumno.create(nombre: params[:nombre], apellido: params[:apellido], email: params[:email], updated_at: Time.now)
                render json: {status: 'SUCCESS', message: 'Guardado con exito'},status: :ok
                else
                render json: {status: 'FAIL', message: 'Error al guardar datos'},status: :ok
                end
            end
        end
    end
end