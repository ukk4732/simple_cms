class SectionController < ApplicationController
  before_action :get_all_sections, only: [:index]
  before_action :find_section, only: [:show, :edit, :update, :delete, :destroy]

  layout "admin"

  def index
  end

  def show
  end

  def new
    @section = Section.new
  end

  def create
    section = Section.new(section_params)
    if section.save
      flash[:notice] = "Section created successfully"
      redirect_to(action: 'index')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @section.update_attributes(section_params)
      flash[:notice] = "Suction updated successfully"
      redirect_to(action: 'show', id: @section.id)
    else
      render 'edit'
    end
  end

  def delete
  end

  def destroy
    @section.destroy
    flash[:notice] = "Section deleted successfully"
    redirect_to(action: 'index')
  end

  private

  def get_all_sections
    @sections = Section.sorted
  end

  def section_params
    params.require(:section).permit(:name, :position, :visible, :content_type, :content)
  end

  def find_section
    @section = Section.find_by_id(params[:id])
  end

end
