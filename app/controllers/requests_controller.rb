class RequestsController < ApplicationController
  
  before_filter :logged_in?, :except => [:index]
  before_filter :is_admin?, :only => [:new, :edit, :create, :destroy] 
  
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(params[:request])
    if @request.save
      redirect_to @request, :notice => "Successfully created request."
    else
      render :action => 'new'
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update_attributes(params[:request])
      redirect_to @request, :notice  => "Successfully updated request."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to requests_url, :notice => "Successfully destroyed request."
  end
end
