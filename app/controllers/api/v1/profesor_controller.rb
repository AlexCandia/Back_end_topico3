module Api
    module V1
        class ProfesorController < ApplicationController
            
            def index
                @Profesor = Profesor.all
                render json: {result: true, message: 'todos los profesores', data:@Profesor},status: :ok
            end
			
			def show
				profesor = Profesor.find(params[:id])
				render json: {status: 'SUCCESS', message: 'detalle curso', data:profesor},status: :ok
                rescue ActiveRecord::RecordNotFound => err
                render json: { message: err.message}, status: :not_found
			end
             def create
                if Profesor.create(nombre: params[:nombre], apellido: params[:apellido], email: params[:email], updated_at: Time.now)
                render json: {status: 'SUCCESS', message: 'Guardado con exito'},status: :ok
                else
                render json: {status: 'FAIL', message: 'Error al guardar datos'},status: :ok
                end
            end
        end
    end
end
