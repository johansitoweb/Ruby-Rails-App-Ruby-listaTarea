class TareasController < ApplicationController
    def index
      @tareas = Tarea.all
    end
  
    def new
      @tarea = Tarea.new
    end
  
    def create
      @tarea = Tarea.new(tarea_params)
      if @tarea.save
        redirect_to tareas_path
      else
        render :new
      end
    end
  
    def edit
      @tarea = Tarea.find(params[:id])
    end
  
    def update
      @tarea = Tarea.find(params[:id])
      if @tarea.update(tarea_params)
        redirect_to tareas_path
      else
        render :edit
      end
    end
  
    def destroy
      @tarea = Tarea.find(params[:id])
      @tarea.destroy
      redirect_to tareas_path
    end
  
    private
  
    def tarea_params
      params.require(:tarea).permit(:titulo, :completada)
    end
  end
  