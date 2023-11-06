# Group5-finalproject Release-Notes

## Required Features
1. The instructor/TA should be able to create presentation events for which evaluations can then be submitted.
- We made changes so that instructor can automatically create teams and assign students to it while creating presentation events. Also, if instructor would like to create a team and then assign students/event later, our application support it.
2. An audience member should be able to submit scores and comments for a presentation. The application should support multiple presentations over the semester (eg, different presenters or multiple presentations by the same presenter); these scores and general comments should be for the categories mentioned in this pdf.
- We've link the evaluation to students & teams. For now students can submit their evaluation (just once). If the instructor closes the event, they're not allowed to submit the evaluation.
3. An administrative interface should give a useful view of the scores and comments submitted for a presentation. This view should support the instructor's need to assign grades based on these evaluations. This view should include the identifying information for who provided the feedback.
- Instructors/TA can assign grades and comments based on the evaluations submitted. They could also update scores even after the due date. The evaluations include identifying information for who provided the feedback.
4. A presenter should have access to the feedback provided by their audience, but should not see any identifying information about who gave the feedback.
- THe presenter could see the official score, average score, and all the feedback provided by their audience without identifying information.
5. Authentication/login. Evaluations should be connected to an authenticated user, preventing forging of evaluations. A gem such as Devise can be used to make this much easier for you.
- Instructor wouldn't be automatically signed into student's interface after creating the student. Clicking log out and then log in the student's interface.
6. At least one useful bit of javascript to improve the user experience. Some examples could be adding auto-completion to certain fields, hiding some fields based on what is selected in another field, etc. There are many possibilities here; consider the behavior that some of your favorite or most-used web applications have and try to find something that needs to be done on the client-side.
- Extra javascript includes:
    - Filtering tables to find specific student/team/event/evaluation
    - Calculate evaluation score after submitting it
    - Calculate average score regarding all evaluations of one team
7. The application (at least the final release version) should look professional. You won't get full credit if you turn in pages that just use the default css provided by the Rails scaffolding.
- We've modify the form of evaluation to make it look professional. Also, make small changes of the view

## Extensions 
1. Class roster. The instructor could control the students' membership using the sub-navbar.
2. Automatically create teams and assign students to teams when creating presentation events.

## Major Changes:
1. Prevent self-evaluation. Presenters (for either individual or group presentations) should not be allowed to submit an evaluation of their own work.
2. Instructor may change the status of presentation event. If the event is closed, then no evaluation may be submitted. However, instructors can still assign/update grades and the team could see their info.
3. Support filtering in instructor's view. Instructors/TA could search through the tables regarding specific student/presentation event/team/evaluation.
4. Automatically calculate the evaluation grade. We've assigned different values to different answers. 20 questions and the total score is 100.
5. Calculating average score for each team. Both instructors/TA and students of that team may be able to see it. Also, teams can see the official grade assigned to them.
6. Output format (.csv) included. Instructor could export data using the sub-navbar and see the result in ./public folders. 
7. If a student/team is destroyed, all its relevant evaluations will be destroyed.
8. Animation in welcome page. Snow in OSU!
9. Meet all the required features and improve it (evaluation)
10. Heroku URL: https://group5-finalproject-heroku.herokuapp.com/