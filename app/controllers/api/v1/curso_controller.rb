module Api
    module V1
        class CursoController < ApplicationController
        #def index
		#		cursos = Curso.all
		#		render json: {status: 'SUCCESS', message: 'todos los cursos', data:cursos},status: :ok
		#	end
		  def index
                @Curso = Curso.all
                render json: {result: true, message: 'todos los cursos', data:@Curso},status: :ok
            end
            
            def ListaAlumnos
				alumnocurso = Curso.find(params[:id])
				render json: {result: true, message: 'Listados de Alumnos', data:alumnocurso.as_json(:include => [:cxa])},status: :ok
                rescue ActiveRecord::RecordNotFound => err
                render json: {result: false, message: err.message}, status: :not_found
			end
            
			def show
				curso = Curso.find(params[:id])
				render json: {result: true, message: 'detalle curso', data:curso},status: :ok
                rescue ActiveRecord::RecordNotFound => err
                render json: {result: false, message: err.message}, status: :not_found
			end
             def create
                if Curso.create(nombre: params[:nombre], descripcion: params[:descripcion], updated_at: Time.now)
                render json: {result: true, message: 'Guardado con exito'},status: :ok
                else
                render json: {result: false, message: 'Error al guardar datos'},status: :error
                end
                rescue ActiveRecord::RecordNotFound => err
                 render json: {result: false, message: 'No se encuentra registro datos'},status: :error
            end
            def update
              @Curso = Curso.find(params[:id])
                if @Curso.update(nombre: params[:nombre], descripcion: params[:descripcion])
                    render json: {result: true, message: 'Modificado con exito'},status: :ok
                else
                    render json: {result: false, message: 'Error al modificar datos'},status: :error
                end
            end            
            def destroy
                if Curso.destroy(params[:id])
                    render json:{result: true, message: 'Eliminado con exito'},status: :ok
                else
                    render json: {result: false, message: 'Error al guardar datos'},status: :error
                end
                rescue ActiveRecord::RecordNotFound => err
                 render json: {result: false, message: 'No se encuentra registro datos'},status: :error
            end
        end
    end
end
