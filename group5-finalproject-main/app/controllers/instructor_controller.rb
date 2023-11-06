class InstructorController < ApplicationController
    before_action :authenticate_instructor!

    def new
        log_out
    end
    def delete
        session[:message] = "Logged Out"
        redirect_to student_sessions_destroy_path
        if session[:user_id] == nil
            redirect_to root
        end
    end
end
