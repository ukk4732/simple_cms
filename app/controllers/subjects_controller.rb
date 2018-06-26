class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show, :edit, :update, :delete, :destroy]
  before_action :get_all_subjects, only: [:index]
  layout false

  def index
  end

  def new
    @subject = Subject.new(name: "Default")
  end

  def create
    subject = Subject.new(subject_params)
    if subject.save
      flash[:notice] = "Subject created successfuly"
      redirect_to(action: 'index')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfuly"
      redirect_to(action: 'show', id: @subject.id)
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @subject.destroy
    flash[:notice] = "Subject deleted successfuly"
    redirect_to(action: 'index')
  end

  def show
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

  def get_all_subjects
    @subjects = Subject.sorted
  end

  def find_subject
    @subject = Subject.find_by_id(params[:id])
  end

end
