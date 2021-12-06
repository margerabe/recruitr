<h1> About </h1>

**[Recruitr](https://recruitr-rm.herokuapp.com/)** is a small API-only app, powering a basic internal recruitment management tool for HR representatives.

About the project:
- No authentication is necessary for the relevant CRUD actions to be performed by the HR manager
- A user model exists nonetheless with a basic JWT token authentication layer for the update & detroy actions on the users controller. It uses ruby-jwt and bcrypt gems (see the branch "authentication")
- No versioning was done in the context of this app
- Unit and functional tests are in place for most functionalities of the app

User stories; the HR manager (the user) is able to:
- Create skills (eg. Marketing, Javascript, Ruby...) which he/she will later ba able link to a specific position
- Create positions for internal job offerings, with the possibility to assign specific skills to it from the start (+ usual CRUD actions)
- Create candidates (starting from the CV profiles he/she receives), which implies linking it directly to one specific position (one position per candidate only) (+ usual CRUD actions)
- Create recruiters, ie. colleagues who will be in charge of interviewing the candidates along the process
- Create interviews, bringing together a candidate and a recruiter at a given point in time. Assumptions: 
  * A candidate can only have one interview at a given point in time, for one position only
  * A recruiter can have many interviews for different positions (who take place at different moments)
- The app has a mailing system to notify recruiter & candidate right after creation of the interview event (contains .ics file for Outlook integration)

<h1> DB Schema </h1>

<img src="https://user-images.githubusercontent.com/66962570/144394337-76f1186d-54fc-440b-a495-4046e4c03337.png" width="500"/>

<h1> Requirements & running the project </h1>

This project runs on Ruby 3.0.3 / Rails 6.1.3 / PostgreSQL DB

- Clone this repo on your local drive
- Run `bundle install`
- Database: run `rails db:drop` `rails db:create` `rails db:migrate` `rails db:seed` to populate the DB
- Launch the development server with `bin/rails server` and navigate to http://localhost:3000
- The project is deployed to Heroku @ [https://recruitr-rm.herokuapp.com/](url)

<h1>API endpoints & docs</h2>

<h3>Skill</h3>

GET /skills  
GET /skills/:id  
POST /skills  
PATCH /skills/:id  
DELETE /skills/:id  

```
{
    "skill": {
        "name": "Ruby on Rails"
    }
}
```

<h3>Position</h3>

GET /positions  
GET /positions/:id  
POST /positions  
PATCH /positions/:id  
DELETE /positions/:id  

```
{
    "position": {
        "title": "Back-end Developer",
        "skill_ids": [5, 6]  (optional)
    }
}
```

<h3>PositionSkill (for assigning a skill to a position post creation of the position)</h3>

GET /position_skills  
POST /position_skills  

```
{ 
    "position_skill": {
        "position_id": 1,
        "skill_id": 1
    }
}
```

<h3>Candidate</h3>

GET /candidates  
GET /candidates/:id  
POST /candidates  
PATCH /candidates/:id  
DELETE /candidates/:id  

```
{
    "candidate": {
        "first_name": "Bertrand",
        "last_name": "Lasalle",
        "email": "blasalle123@gmail.com", 
        "position_id": 1
    }
}
```

<h3>Recruiter</h3>

GET /recruiters  
GET /recruiters/:id  
POST /recruiters  
PATCH /recruiters/:id  
DELETE /recruiters/:id  

```
{
    "recruiter": {
        "first_name": "Jean",
        "last_name": "Ponty",
        "email": "jponty123@gmail.com"
    }
}
```

<h3>Interview</h3>

GET /interviews  
GET /interviews/:id  
POST /interviews  
PATCH /interviews/:id  
DELETE /interviews/:id  

```
{
    "interview": {
        "start_time": "16/02/2022 10:00", 
        "end_time": "16/02/2022 11:00", 
        "candidate_id": 1, 
        "recruiter_id": 1
    }
}
```

