class SectionRolesController < ApplicationController
  def new
#   @section_role = request.section_role.build
  end

  def edit
   request
  end

  private
  def request
    @request = Request.find(params[:request_id])
  end

end
