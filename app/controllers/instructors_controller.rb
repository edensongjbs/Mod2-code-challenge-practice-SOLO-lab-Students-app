class InstructorsController < ApplicationController

  before_action :current_instructor, only: [:show]

  def index
    @instructors = Instructor.all
  end

  def show
  end

  private

  def current_instructor
    @instructor = Instructor.find(params[:id])
  end

end
