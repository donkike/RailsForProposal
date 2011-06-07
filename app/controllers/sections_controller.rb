class SectionsController < ApplicationController
  before_filter :logged_in?
  
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(params[:section])
    if @section.save
      redirect_to @section, :notice => "Seccion creada exitosamente."
    else
      render :action => 'new'
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
      redirect_to @section, :notice  => "Successfully updated section."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to sections_url, :notice => "Seccion eliminada exitosamente."
  end
end
