class StudentsController < ApplicationController
  before_action :set_student, except: [:index, :create, :new]

  def new
    @student = Student.new
    @subjects = @student.subjects.new
  end
  
  def create
    @student = Student.new(student_params)
    
    if @student.save
      redirect_to students_path, notice: "Student created successfully."
    else
      render :new
    end
  end

  def index
    @students = Student.all
  end

  def show
    
  end

  def edit
    @subjects = @student.subjects
  end

  def update
    if @student.update_attributes(student_params)
      redirect_to students_path, notice: "Student updated successfully."
    else
      render :new, errors: @student.errors.full_messages
    end
  end
  
  def destroy
    if @student.destroy
      redirect_to root_path, notice: "Student-id #{@student.id} deleted successfully."
    else
      redirect_to :back, errors: "Something went wrong."
    end
  end

  def assign_teachers
    teacher_ids = @student.teachers.map(&:id)
    @teachers= Teacher.all.where.not(id: teacher_ids)
    redirect_to new_teacher_path, notice: "Teachers not found" unless @teachers.present?
  end

  def create_teachers
    teachers = Teacher.where(id: params[:teacher_ids])
    @student.teachers << teachers
    if @student.save
      redirect_to root_path, notice: "Teachers assigned successfully."
    else
      redirect_to :back, errors: "Something went wrong."
    end
  end

  def assign_subjects
    subject_ids = @student.subjects.map(&:id)
    @subjects= Subject.all.where.not(id: subject_ids)
    redirect_to new_subject_path, notice: "Subjects not found" unless @subjects.present?
  end

  def create_subjects
    subject_ids = params[:subject_ids]
    subjects = Subject.where(id: subject_ids)
    @student.subjects << subjects
    if @student.save
      redirect_to root_path, notice: "Subjects assigned successfully."
    else
      redirect_to :back, errors: "Something went wrong."
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :middle_name, :last_name, :father_name, :gender,
                                  :mother_name, :class_roll_no, :date_of_birth, :birth_place, :language, :religion, :category, 
                                  :address_line1, :address_line2, :city, :state, :pin_code, :country, :phone, :email,
                                  :subjects_attributes => [:id, :name, :code]
                                )
  end

  def set_student
    @student = Student.find_by_id(params[:id])
    redirect_to root_path, notice: "Student not found." unless @student.present?
  end
end