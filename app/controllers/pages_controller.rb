class PagesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :about]
  before_action :find_page, only: [:show, :edit, :update, :destroy]

  def about
    @page = Page.find('1')
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page].permit(:description, :image))
    if @page.save
      redirect_to @page
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @page.update(params[:page].permit(:description, :image))
      redirect_to "/about"
    else
      render 'edit'
    end
  end

  private

  def find_page
    @page = Page.find(params[:id])
  end
end
