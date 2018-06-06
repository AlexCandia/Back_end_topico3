module Api
    module V1
        class ContenidoController < ApplicationController
            def index
                @Contenido = Contenido.all
                render json: {result: true, message: 'todos los contenidos', data:@Contenido},status: :ok
            end
            def create
                @Contenido = Contenido.create(titulo: params[:titulo], descripcion: params[:descripcion], updated_at: Time.now, url: params[:url])
                @Curso = Curso.find(params[:id])
                if ContenidoCurso.create(contenido: @Contenido, curso: @Curso)
                render json: {result: true, message: 'Guardado con exito'},status: :ok
                else
                render json: {result: false, message: 'Error al guardar datos'},status: :error
                end
                rescue ActiveRecord::RecordNotFound => err
                 render json: {result: false, message: 'No se encuentra registro datos'},status: :error
            end
            def update
              @Contenido = Contenido.find(params[:id])
                if @Contenido.update(titulo: params[:titulo], descripcion: params[:descripcion], url: params[:url])
                    render json: {result: true, message: 'Modificado con exito'},status: :ok
                else
                    render json: {result: false, message: 'Error al modificar datos'},status: :error
                end
            end            
            def destroy
                if Contenido.destroy(params[:id])
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