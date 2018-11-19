class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.create(teacher_params)
    if @teacher.save
        redirect_to @teacher, alert: "Teacher created successfully."
    else
        redirect_to new_teacher_path, alert: "Error creating Teacher."
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher.update_attributes!(teacher_params)

    respond_to do |f|
      f.js
    end
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
