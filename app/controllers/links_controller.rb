class LinksController < ApplicationController
  def index
    redirect_to root_url
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def edit
    @link = Link.find(params[:id])
  end

  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link }
      else
        format.html { render :action => :new }
      end
    end
  end

  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to @link }
      else
        format.html { render :action => :edit }
      end
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end
end
