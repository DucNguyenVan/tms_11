class Admin::CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def index
    @courses = Course.paginate page: params[:page]
  end

  def show
    @course = Course.find params[:id]
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = "Create course successfully!"
      redirect_to admin_course_path(@course)
    else
      render 'new'
    end
  end

  private
  def course_params
    params.require(:course).permit(:name, :description, :begin_at, :end_at)
  end
end
