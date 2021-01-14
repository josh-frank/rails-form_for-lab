class StudentsController < ApplicationController
  
  def index
    @all_students = Student.all
  end

  def new
    @new_student = Student.new
  end

  def create
    new_student = Student.create( student_params( :first_name, :last_name ) )
    redirect_to student_path( new_student )
  end

  def show
    @this_student = Student.find( params[ :id ] )
  end

  def edit
    @this_student = Student.find( params[ :id ] )
  end

  def update
    updated_student = Student.find( params[ :id ] )
    updated_student.update( student_params( :first_name, :last_name ) )
    redirect_to student_path( updated_student )
  end

  private

  def student_params( *args )
    params.require( :student ).permit( *args )
  end

end
