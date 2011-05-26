class RequestSectionsController < ApplicationController
  def index
    @request_sections = rfp.request_sections
  end

  def show
    @request_section = RequestSection.find(params[:id])
  end

  def new
    @request_section = rfp.request_sections.build
  end

  def create
    @request_section = RequestSection.new(params[:request_section])
    if @request_section.save
      redirect_to @request_section, :notice => "Successfully created request section."
    else
      render :action => 'new'
    end
  end

  def edit
    @request_section = RequestSection.find(params[:id])
  end

  def update
    @request_section = RequestSection.find(params[:id])
    if @request_section.update_attributes(params[:request_section])
      redirect_to @request_section, :notice  => "Successfully updated request section."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @request_section = RequestSection.find(params[:id])
    @request_section.destroy
    redirect_to request_sections_url, :notice => "Successfully destroyed request section."
  end
  
  private
  def rfp
    @request = Request.find(params[:request_id])
  end
end
