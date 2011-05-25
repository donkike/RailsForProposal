class SectionRolesController < ApplicationController
  def new    
    @section_role = rfp.section_roles.build
  end

  def edit
   rfp
  end
  
  private
  def rfp
    @request = Request.find(params[:request_id])
  end

end
