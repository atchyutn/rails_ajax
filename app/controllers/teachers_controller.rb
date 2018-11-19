class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.create(teacher_params)

    redirect_to teachers_path
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:id])

    @teacher.update_attributes!(teacher_params)
  end

  def destroy
    @teacher = Teacher.destroy(params[:id])

    redirect_to teachers_path
  end


  private

  def teacher_params
    params.require(:teacher).permit(:name, :subject)
  end
end
