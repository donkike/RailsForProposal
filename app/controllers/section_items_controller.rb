class SectionItemsController < ApplicationController
  def index
    @section_items = SectionItem.all
  end

  def show
    @section_item = SectionItem.find(params[:id])
  end

  def new
    @section_item = SectionItem.new
  end

  def create
    @section_item = SectionItem.new(params[:section_item])
    if @section_item.save
      redirect_to @section_item, :notice => "Successfully created section item."
    else
      render :action => 'new'
    end
  end

  def edit
    @section_item = SectionItem.find(params[:id])
  end

  def update
    @section_item = SectionItem.find(params[:id])
    if @section_item.update_attributes(params[:section_item])
      redirect_to @section_item, :notice  => "Successfully updated section item."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @section_item = SectionItem.find(params[:id])
    @section_item.destroy
    redirect_to section_items_url, :notice => "Successfully destroyed section item."
  end
end
