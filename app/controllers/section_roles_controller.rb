class SectionRolesController < ApplicationController
  def new    
    @section_role = rfp.section_roles.build
  end

  def edit
    rfp
    @section_role = SectionRole.find(params[:id])
  end

  def index
      @requests = []
      if params[:request_id]
         
      elsif params[:user_id]
	@section_roles = User.find(params[:user_id]).section_roles
        for section_role in @section_roles
	   @requests << section_role.request_section.request
	end
      end			
  end 
  
  private
  def rfp
    @request = Request.find(params[:request_id])
  end

end
