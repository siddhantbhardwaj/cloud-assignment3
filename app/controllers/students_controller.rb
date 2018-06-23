class StudentsController < ApplicationController
  def index
    @students = Student.all
    render json: @students
  end
  
  def create
    @student = Student.new(student_params)
    if @student.save
      render json: @student
    else
      render json: { errors: @student.errors.messages }
    end
  end
  
  def upload_image
    @student = Student.find_by(student_id: params[:student_id])
    @student.images.build(image_params)
  end
  
  def images
    student = Student.find_by(student_id: params[:student_id])
    if student
      images = []
      student.images.each do |image|
        images.push(cl_image_path(image.picture_code + '.jpg'))
      end
      render json: { images: images }
    else
      render json: { error: 'Student not found' }
    end
  end
  
  def destroy
    @student = Student.find_by(student_id: params[:student_id])
    if @student && @student.destroy
      render json: { success: true }
    else
      render json: { error: 'There was an error deleting user with this id' }
    end
  end
  
  private
  def student_params
    params.permit(:student_id, :nickname)
  end
  
  def image_params
    params.permit(:student_id, :picture_code)
  end
end
