class StudentsController < ApplicationController
  before_action :current_student, only: [:show, :edit, :update]

  def index
    @students = Student.all
  end

  def show
  end

  def edit
    @instructors = Instructor.all
  end

  def new
    @student = Student.new
    @instructors = Instructor.all
  end

  def create
    @student = Student.new(student_params)
    if @student.valid?
      @student.save
      redirect_to instructor_path(@student.instructor)
    else
      flash[:message] = @student.errors.full_messages[0]
      @instructors = Instructor.all
      render "new"
      # redirect new_student_path
    end
  end

  def update
    @student.assign_attributes(student_params)
    if @student.valid?
      @student.save
      redirect_to student_path(@student)
    else
      flash[:message] = @student.errors.full_messages[0]
      @instructors = Instructor.all
      render "edit"
      # redirect_to edit_student_path(@student)
    end
  end

  private

  def current_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :major, :instructor_id, :age)
  end
  
end
