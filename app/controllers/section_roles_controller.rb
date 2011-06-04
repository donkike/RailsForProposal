class SectionRolesController < ApplicationController
  def new    
    @section_role = rfp.section_roles.build
    @sections = {}
    for request_section in rfp.request_sections
      @sections[request_section.section.name] = request_section.id
    end
  end

  def edit
    rfp
    @section_role = SectionRole.find(params[:id])
  end

  def index
      if params[:request_id]	         
      elsif params[:user_id]
	      @section_roles = User.find(params[:user_id]).section_roles
      end		
  end 
  
  def create
    @section_role = SectionRole.new(params[:section_role])
    if @section_role.save
      redirect_to @section_role.request_section.request, :notice => "Successfully created role" 
    else
      rfp
      render :action => 'new'
    end
  end
  
  private
  def rfp
    @request = Request.find(params[:request_id])
  end

end
