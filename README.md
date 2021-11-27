**[Recruiter app](https://recruitr-rm.herokuapp.com/) - Small API powering a recruitment system**

No authentication layer was built in the context of this app. Assumption: only one user, the HR manager, who is logged in from the start.

This small API contains basic RESTful routes allowing **CRUD actions** on the following models: 
- Position
- Candidate (creating a candidate implies linking it to a position from the start. Assumption: one position per candidate only)
- Recruiter
- Skill (there is a join table between positions and skills given the N-N relationship)
- Interview (see below)

To **assign a skill to a position**: 
- either at creation of the position by providing the skill_id(s) via POST /positions
- OR by creating an instance of PositionSkill by providing the position_id and skill_id (POST /position_skills)

Possibility to **create an interview** via POST /interviews. Based on following assumptions: 
- A candidate can only have one interview, for only one position
- A recruiter needs to be assigned manually to the interview based on its id (the recruiter matching/suggestion mechanism is out of scope of this app)
- A recruiter can have many interviews for different positions (at different points in time)
- The interview necessitates a start_time and end_time, both DateTime objects in Ruby. 

_Example of creation of an interview API call (with raw json as input):

POST /interviews

{
    "interview": {
        "start_time": "16/02/2022 10:00", 
        "end_time": "16/02/2022 11:00",
        "candidate_id": 56,
        "recruiter_id": 54
    }
}_

After creation of an interview, an **e-mail** is sent to both the recruiter and the candidate along with an .ics file for Outlook integration.
For the mailer to work, uncomment lines in create action of InterviewsController and enter Gmail password in development.rb
