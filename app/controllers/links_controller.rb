class LinksController < ApplicationController
  before_filter :authenticate_user!

  def new
    @link = Link.new
  end

  def edit
    @link = Link.find(params[:id])
  end

  def create
    @link = Link.new(params[:link])
    @link.user = current_user

    respond_to do |format|
      if @link.save
        format.html { redirect_to :back }
      else
        format.html { render :action => :new }
      end
    end
  end

  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to :back }
      else
        format.html { render :action => :edit }
      end
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @commits.where(:link => @link).all
    
    @link.destroy
    @commits.each { |commit| commit.destroy }

    respond_to do |format|
      format.html { redirect_to :back }
    end
  end
end
