class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_student, :log_out, :log_in, :is_member?, :is_authorized_user_signed_in?, :export
    @current_student
    @current_team     #Would be set by the teams controller
    def after_sign_in_path_for(instructors)
        instructor_home_page_path # your path
    end

    def export
      teams = Team.all
      export_to_csv("teams", teams)

      students = Student.all
      export_to_csv("students", students)

      evaluations = Evaluation.all
      export_to_csv("evaluations", evaluations)
     
     redirect_back fallback_location: "/"
     flash.alert = "Exported data to public/data.csv"
    end
  
    
    private

    def export_to_csv(tablename, tabledata)
      file = "#{Rails.root}/public/#{tablename}.csv"
      CSV.open(file, 'w') do |writer|
        writer << tabledata.first.attributes.map {|a,v| a}
        tabledata.each do |s|
          writer << s.attributes.map {|a,v| v}
        end
       end
    end
    
    def logged_in?
      !current_student.nil?
    end
    def log_in(student)
      session[:student_id] = student.id
      flash.alert = "Signed In"
    end
  
    def current_student
      if session[:student_id]
        @current_student ||= Student.find(session[:student_id])
      end
    end
    def log_out
      if session[:student_id]
        session.delete(:student_id)
      end
      @current_student = nil
    end
  
    def current_student?(student)
      student == current_student
    end

    def is_authorized_user_signed_in?
      if !(instructor_signed_in? || logged_in?)
        redirect_to student_sessions_new_path
        flash[:alert] = "You are not logged in. Only authorized users are allowed to access this content"
      end
    end
    def redirect_back_or(default)
      redirect_to(session[:forwarding_url] || default)
      session.delete(:forwarding_url)
    end
  
    def store_location
      session[:forwarding_url] = request.original_url if request.get?
    end
    def is_member?(student, team)
      studentTeams = StudentsTeam.find_by(team_id: team.id, student_id: student.id)
      if studentTeams
        puts studentTeams.team_id
      end
      !studentTeams.nil?
    end

end
