class PagesController < ApplicationController
  def index
    @links = Link.order('updated_at DESC').all
  end
end
