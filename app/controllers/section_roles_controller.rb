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
