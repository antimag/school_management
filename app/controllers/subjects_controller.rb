class SubjectsController < ApplicationController
  before_action :set_subject, except: [:index, :create, :new]

  def new
    @subject = Subject.new
  end
  
  def create
    @subject = Subject.new(subject_params)
    
    if @subject.save
      redirect_to subjects_path, notice: "Subject created successfully."
    else
      render :new
    end
  end

  def index
    @subjects = Subject.all
  end

  def show
    
  end

  def edit
  end

  def update
    if @subject.update_attributes(subject_params)
      redirect_to subjects_path, notice: "Subject updated successfully."
    else
      render :new, errors: @subject.errors.full_messages
    end
  end
  
  def destroy
    if @subject.destroy
      redirect_to root_path, notice: "Subject-id #{@subject.id} deleted successfully."
    else
      redirect_to :back, errors: "Something went wrong."
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :code)
  end

  def set_subject
    @subject = Subject.find_by_id(params[:id])
    redirect_to root_path, notice: "Subject not found." unless @subject.present?
  end
end
