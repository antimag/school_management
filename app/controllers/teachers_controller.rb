class TeachersController < ApplicationController
  before_action :set_teacher, except: [:index, :create, :new]

  def new
    @teacher = Teacher.new
    @subjects = @teacher.subjects.new
  end
  
  def create
    @teacher = Teacher.new(teacher_params)
    
    if @teacher.save
      redirect_to teachers_path, notice: "teacher created successfully."
    else
      render :new
    end
  end

  def index
    @teachers = Teacher.all
  end

  def show
    
  end

  def edit
    @subjects = @teacher.subjects
  end

  def update
    if @teacher.update_attributes(teacher_params)
      redirect_to teachers_path, notice: "teacher updated successfully."
    else
      render :new, errors: @teacher.errors.full_messages
    end
  end
  
  def destroy
    if @teacher.destroy
      redirect_to root_path, notice: "teacher-id #{@teacher.id} deleted successfully."
    else
      redirect_to :back, errors: "Something went wrong."
    end
  end

  def assign_students
    student_ids = @teacher.students.map(&:id)
    @students= Student.all.where.not(id: student_ids)
    redirect_to new_student_path, notice: "Teachers not found" unless @students.present?
  end

  def create_students
    students = Student.where(id:  params[:student_ids])
    @teacher.students << students
    if @teacher.save
      redirect_to root_path, notice: "Students assigned successfully."
    else
      redirect_to :back, errors: "Something went wrong."
    end
  end

  def assign_subjects
    subject_ids = @teacher.subjects.map(&:id)
    @subjects= Subject.all.where.not(id: subject_ids)
    redirect_to new_subject_path, notice: "Subjects not found" unless @subjects.present?
  end

  def create_subjects
    subjects = Subject.where(id: params[:subject_ids])
    @teacher.subjects << subjects
    if @teacher.save
      redirect_to root_path, notice: "Subjects assigned successfully."
    else
      redirect_to :back, errors: "Something went wrong."
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:first_name, :middle_name, :last_name, :address, 
                                    :qualification, :city, :state, :pin_code, :country,
                                    :phone, :email, :gender,
                                  :subjects_attributes => [:id, :name, :code]
                                )
  end

  def set_teacher
    @teacher = Teacher.find_by_id(params[:id])
    redirect_to root_path, notice: "teacher not found." unless @teacher.present?
  end
end