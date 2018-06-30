class PagesController < ApplicationController
  before_action :get_all_pages, except: [:show, :delete, :destroy]
  before_action :find_page, only: [:show, :edit, :update, :delete, :destroy]
  layout "admin"

  def index
  end

  def show
  end

  def new
    @page = Page.new
    @pages_count = @pages.count + 1
  end

  def create
    page = Page.new(page_params)
    if page.save
      flash[:notice] = "Page created successfuly"
      redirect_to(action: 'index')
    else
      @pages_count = @pages.count + 1
      render :new
    end
  end

  def edit
    @pages_count = @pages.count
  end

  def update
    if @page.update_attributes(page_params)
      flash[:notice] = "Page updated successfuly"
      redirect_to(action: 'index')
    else
      @pages_count = @pages.count 
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
    params.require(:page).permit(:name, :position, :visible, :permalink, :subject_id)
  end

  def get_all_pages
    @pages = Page.sorted
  end

  def find_page
    @page = Page.find_by_id(params[:id])
  end

end
