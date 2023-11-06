class StudentSessionsController < ApplicationController
  def new
    log_out
  end

  def create
    student = Student.find_by(username: params[:session][:username])

    if student && student.authenticate(params[:session][:password])
      log_in student
      puts "Redirecting to show view"
      redirect_to action:'show', controller: 'students', id: student.id

    else
      flash.now[:notice] = "Invalid email/password"
      puts "Redirecting to signin"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to destroy_instructor_session_path
  end
end
