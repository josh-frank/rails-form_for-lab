class SchoolClassesController < ApplicationController
  
  def index
    @all_school_classes = SchoolClass.all
  end
  
  def new
    @new_school_class = SchoolClass.new
  end

  def create
    new_school_class = SchoolClass.create( school_class_params( :title, :room_number ) )
    redirect_to school_class_path( new_school_class )
  end

  def show
    @this_school_class = SchoolClass.find( params[ :id ] )
  end

  def edit
    @this_school_class = SchoolClass.find( params[ :id ] )
  end

  def update
    updated_school_class = SchoolClass.find( params[ :id ] )
    updated_school_class.update( school_class_params( :title, :room_number ) )
    redirect_to school_class_path( updated_school_class )
  end

  private

  def school_class_params( *args )
    params.require( :school_class ).permit( *args )
  end

end
