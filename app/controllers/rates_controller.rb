class RatesController < ApplicationController
  
  def show
     @section_role = SectionRole.find(params[:id])
  end
  
  def new
     @section_role = SectionRole.find(params[:id])  
  end
  
  def create
    @section_role = SectionRole.find(params[:section_role][:id])
    @section_role.rate(params[:section_items])
    @section_role.save
    redirect_to rate_path(@section_role.id), :notice => "Rated!"
  end
  
end
