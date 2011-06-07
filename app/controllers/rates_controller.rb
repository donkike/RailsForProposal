class RatesController < ApplicationController
  before_filter :logged_in?
  
  def show
     @section_role = SectionRole.find(params[:id])
     @options = {'Si' => 'accepted', 'No' => 'rejected'}
  end
  
  def new
     @section_role = SectionRole.find(params[:id])  
  end
  
  def create
    @section_role = SectionRole.find(params[:section_role][:id])
    if params[:section_items] and params[:section_items].count == @section_role.request_section.section_items.count
      @section_role.rate(params[:section_items])
      redirect_to rate_path(@section_role.id), :notice => "Calificado!"      
    else  
      redirect_to new_rate_path(:id => @section_role.id), :notice => "No ha calificado todos los items"
    end
  end
  
end
