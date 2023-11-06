# Group5-finalproject

## Summary
    This website is the final project completed for CSE 3901, and is meant to serve as a place to view, submit 
    and update information for the course. You may use the navigation bar above to move to different pages in 
    order to login, view students, teams, and presentation events, and submit evaluations for these events. 
    The evaluations would be helpful for graders as well as students.
  
  [Reference: https://web.cse.ohio-state.edu/~joseph.97/courses/3901/labs/project6.html]

## How to run the application:
1. Clone the repository 
- `$ git clone https://github.com/cse3901-osu-2021au-910/group5-finalproject`
2. Gems installed 
- `$ yarn --check -file`
- `$ gem install bundler:2.2.29`
3. Install PostgreSqL 
- `$ sudo apt install postgresql-contrib libpq-dev`
- `$ bundle install`
- `$ sudo apt update`
- `$ sudo apt-get install libpq-dev`
- `$ sudo apt install postgresql-contrib`
- `$ sudo -i -u postgres`
- `$ psql`
- `$ create USER team5 with Password 'MyPassword';`
- `$ alter role team5 CREATEDB SUPERUSER;`
4. Check the database 
- `$ \l`
- `$ exit`
- `$ exit`
5. Set up the table 
- `$ rails db:drop db:create db:migrate`
6. Get the random data 
- `$ rails db:seed`
7. Enter the system! 
- `$ rails s`

P.S Seed.rb only fake students' data. For full experience, please create presentation yourself.

## Instruction:
- Steps: (For full experience)
    - Sign up for Instructor 
    - Enjoy the Instructor's view (Create the presentation -> automatically create teams, then you can assign grades and add comments)
    - In instructor's view, create a new student, log out
    - Use this student's information to log in student's interface
    - You could evaluate by clicking on the task list.
    
    P.S. You may create a team by yourself and assign it to any presentation, and we support assigning students to teams.
- Instructors could: 
    - Create/Read/Update/Delete students, presentations, and teams
    - Have the identifying information regarding evaluations
    - First, we assume every instructor should sign up. Please go to the sign up page, and you will be redirected to the dashboard
- Students could:
    - View personal teams and presentations
    - Create/Read/Update evaluations
    - First, we assume every student has been already enrolled in the page. Please start with instructor view, and then you can create a student -> student view. 
    - Also, if you would like to check the other students' page, please go to instructor's interface and change the password. Then you can use the password to log in.

    JavaScript: apply to the evaluation form to make sure all questions are answered before submitting & Calculate score. 

## Extensions
1. Class roster. The instructor could control the students' membership using the sub-navbar.
2. Prevent self-evaluation. Presenters (for either individual or group presentations) should not be allowed to submit an evaluation of their own work.
3. Instructor may change the status of presentation event. If the event is closed, then no evaluation may be submitted. However, instructors can still assign/update grades and the team could see their info.
4. Automatically create teams and assign students to teams when creating presentation events.
5. Support filtering in instructor's view. Instructors/TA could search through the tables regarding specific student/presentation event/team/evaluation.
6. Automatically calculate the evaluation grade. We've assigned different values to different answers. 20 questions and the total score is 100.
7. Calculating average score for each team. Both instructors/TA and students of that team may be able to see it. Also, teams can see the official grade assigned to them.
8. Output format (.csv) included. Instructor could export data using the sub-navbar and see the result in ./public folders. 
9. If a student/team is destroyed, all its relevant evaluations will be destroyed.
10. Animation in welcome page. Snow in OSU! 
11. Deploy the application to heroku. 
- Heroku URL: https://group5-finalproject-heroku.herokuapp.com/
    - We've ran the rails:seed in heroku, so there're already 30 students in it.
    - One instructor has already signed up. 
        - Email: 12345@osu.edu
        - Password: asdfasdf
    
    P.S. We've set the standard that the export would work in the condition that there exists at least one evaluation in the database. If you submit one evaluation in student's interface and then go back to instructor's interface, you could see the export_csv button in the sub navbar.
    
    Additional packages include cocoon (gem for nested forms), jQuery, bootstrap (for styling), csv, devise, and Faker.
## Team members:
- Andrews Kontoh
- Chaobo Cai
- Yang Li
- Olivia Ridge
- Thomas Ghebremariam
