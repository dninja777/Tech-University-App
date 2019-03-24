class StudentsController < ApplicationController
	before_action :set_student, only: [:edit, :update, :show, :destroy]
	def index
		@students = Student.all
	end

	def show
		@student = Student.find(params[:id])
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			flash[:notice] = "You have successfully signed up"
			redirect_to root_path

		else
			render 'new'
		end
	end

	def edit
		@student = Student.find(params[:id])
	end

	def update
		@student = Student.find(params[:id])
		if @student.update(student_params)
			flash[:success] = "Student profile was updated"
			redirect_to student_path(@student)
		else
			render 'edit'
		end


	end

	def destroy
		@student.destroy
		flash[:danger] = "Student profile was deleted"
		redirect_to students_path
	end



	private

	def set_student
		@student = Student.find(params[:id])
	end
	def student_params
	params.require(:student).permit(:name, :email)	
	end

end