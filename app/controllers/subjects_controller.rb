class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show, :edit, :update, :delete, :destroy]
  before_action :get_all_subjects, except: [:show, :delete]
  layout "admin"

  def index
  end

  def new
    @subject = Subject.new(name: "Default")
    @subjects_count = @subjects.count + 1
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject created successfuly"
      redirect_to(action: 'index')
    else
      @subjects_count = @subjects.count + 1
      render :new
    end
  end

  def edit
    @subjects_count = @subjects.count
  end

  def update
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfuly"
      redirect_to(action: 'show', id: @subject.id)
    else
      @subjects_count = @subjects.count
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
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end

  def get_all_subjects
    @subjects = Subject.sorted
  end

  def find_subject
    @subject = Subject.find_by_id(params[:id])
  end

end
