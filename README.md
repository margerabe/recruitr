**Recruiter app - Small API powering a recruitment system**

This small API contains basic RESTful routes allowing CRUD actions on the following models: 
- Position
- Candidate
- Recruiter
- Skill

To assign a skill to a position: 
- either at creation of the position by providing the skill_id(s) via POST /positions
OR by creating an instance of PositionSkill by providing the position_id and skill_id (POST /position_skills)

Possibility to create an interview via POST /interviews
Assumptions: 
- A candidate can only have one interview, for only one position
- A recruiter can have many interviews for different positions (at different points in time)

No authentication layer was built in the context of this app.
