class StudentsController < ApplicationController
	before_action :set_student, only: [:edit, :update, :show, :destroy]
	def index
		@students = Student.all
	end

	def show
		
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			flash[:notice] = "You have successfully signed up"
			redirect_to @student

		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
	
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
		redirect_to student_path
	end



	private

	def set_student
		@student = Student.find(params[:id])
	end
	def student_params
	params.require(:student).permit(:name, :email, :password, :password_confirmation)	
	end

end