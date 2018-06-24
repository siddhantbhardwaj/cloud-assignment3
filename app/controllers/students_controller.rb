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
      render json: { message: @student.errors.messages }, status: 400, head: :bad_request
    end
  end
  
  def upload_image
    @student = Student.find_by(student_id: params[:id])
    if @student
      image = @student.images.build({ picture_code: params[:picture_code] })
      if image.save
        render json: image
      else
        render json: { message: image.errors.messages }, status: 400, head: :bad_request
      end
    else
      render json: { error: 'Student not found' }, status: :not_found, head: :not_found
    end
  end
  
  def images
    student = Student.find_by(student_id: params[:id])
    if student
      images = []
      student.images.each do |image|
        img_extension = image.picture_code.split('.').length > 1 ? '' : '.jpg'
        images.push(Cloudinary::Utils.cloudinary_url(image.picture_code + img_extension))
      end
      render json: { images: images }
    else
      render json: { error: 'Student not found' }, status: :not_found, head: :not_found
    end
  end
  
  def destroy
    @student = Student.find_by(student_id: params[:id])
    if @student && @student.destroy
      render json: { success: true }
    else
      render json: { error: 'There was an error deleting user with this id' }, status: :not_found, head: :not_found
    end
  end
  
  private
  def student_params
    params.permit(:student_id, :nickname)
  end

end
