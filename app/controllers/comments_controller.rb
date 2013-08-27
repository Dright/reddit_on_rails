class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    @comments = Comment.where(:link_id => params[:link_id]).includes(:user).order('created_at DESC').all
    @link = Link.find(params[:link_id])
  end

  def create
    @comment = Comment.new(params[:comment])
    
    respond_to do |format|
      if @comment.save
        format.json { render json: @comment }
      else
        format.json { render json: @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
  end

  def delete
  end
end
