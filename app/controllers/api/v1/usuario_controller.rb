module Api
    module V1
        class UsuarioController < ApplicationController
		   def index
                @Usuario = Usuario.all
                render json: {result: true, message: 'todos los usuario', data:@Usuario},status: :ok
            end            
			def show
				usuario = Usuario.find(params[:id])
                #@permission = Permission.where(:user_id=>params[:user_id]).where(:project_id=>params[:project_id]).first
				render json: {result: true, message: 'detalle Usuario', data:usuario},status: :ok
                rescue ActiveRecord::RecordNotFound => err
                render json: {result: false, message: err.message}, status: :not_found
			end
            def logear
                @Usuario = Usuario.find_by_correo_and_password(params[:correo],params[:password])
                if !@Usuario.nil?
                     render json: {result: true, message: 'Ingreso Correcto', data:@Usuario},status: :ok
                else
                    render json: {result: false, message: 'Usuario y/o Contraseña incorrecta'},status: :error
                end
            end
            def create
                @Usuario = Usuario.find_by_correo(params[:correo])            
                if !@Usuario.nil?
				    render json: {result: true, message: 'Usuario ya registrado', data:@Usuario},status: :ok
                else
                    if params[:tipo] == "1" 
                        @Alumno = Alumno.find_by_email(params[:correo])
                        if !@Alumno.nil?
                            if Usuario.create(user: @Alumno.id, password: params[:password],  tipo: params[:tipo], correo: params[:correo], updated_at: Time.now)
                                render json: {result: true, message: 'Alumno creado'},status: :ok
                            else
                                render json: {result: false, message: 'Error al guardar datos'},status: :error
                            end
                        else
                            render json: {result: false, message: 'Alumno no matriculado'},status: :error
                        end
                    end
                    if params[:tipo] == "2"
                        @Profesor = Profesor.find_by_email(params[:correo])
                        if !@Profesor.nil?
                            if Usuario.create(user: @Profesor.id, password: params[:password],  tipo: params[:tipo], correo: params[:correo], updated_at: Time.now)
                                render json: {result: true, message: 'Profesor creado'},status: :ok
                            else
                                render json: {result: false, message: 'Error al guardar datos'},status: :error
                            end
                        else
                            render json: {result: false, message: 'Profesor no contratado'},status: :error
                        end
                    end
                end 
            end
        end
    end
end