class PagesController < ApplicationController
  before_action :get_all_pages, only: [:index]
  before_action :find_page, only: [:show, :edit, :update, :delete, :destroy]
  layout false

  def index
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    page = Page.new(page_params)
    if page.save
      flash[:notice] = "Page created successfuly"
      redirect_to(action: 'index')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfuly"
      redirect_to(action: 'index')
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @page.destroy
    flash[:notice] = "Page deleted successfuly"
    redirect_to(action: 'index')
  end

  private

  def page_params
    params.require(:page).permit(:name, :position, :visible, :permalink)
  end

  def get_all_pages
    @pages = Page.sorted
  end

  def find_page
    @page = Page.find_by_id(params[:id])
  end

end
