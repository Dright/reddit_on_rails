class PagesController < ApplicationController
  def index
    params[:page] ||= 1
    @links = Link.order('updated_at DESC').page(params[:page]).per_page(25)
  end
end
