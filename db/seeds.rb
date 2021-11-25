puts "Destroying existing records..."

Candidate.destroy_all
Position.destroy_all
Recruiter.destroy_all
Skill.destroy_all

puts "Creating positions..."

position1 = Position.create(title: "Frontend Engineer")
position2 = Position.create(title: "Marketing Content Manager")
position3 = Position.create(title: "Mobile Developer")
position4 = Position.create(title: "Backend Intern")

puts "Positions created!"

puts "Creating candidates..."

Candidate.create(first_name: "Jean-Marie", last_name: "Leduc", email: "jleduc@gmail.com", position: position1)
Candidate.create(first_name: "Claude", last_name: "Dufonsny", email: "cdufonsny@gmail.com", position: position2)
Candidate.create(first_name: "Arthur", last_name: "Dupont", email: "adupont@gmail.com", position: position3)
Candidate.create(first_name: "Fernand", last_name: "Lelob", email: "flelob@gmail.com", position: position4)

puts "Candidates created!"

puts "Creating recruiters..."

Recruiter.create(first_name: "Jean-Marie", last_name: "Leduc", email: "jleduc@gmail.com")
Recruiter.create(first_name: "Claude", last_name: "Dufonsny", email: "cdufonsny@gmail.com")
Recruiter.create(first_name: "Arthur", last_name: "Dupont", email: "adupont@gmail.com")
Recruiter.create(first_name: "Fernand", last_name: "Lelob", email: "flelob@gmail.com")

puts "Recruiters created!"

puts "Creating skills..."

Skill.create(name: "Marketing")
Skill.create(name: "Javascript")
Skill.create(name: "Ruby")
Skill.create(name: "Coffeescript")

puts "Skills created!"

puts "All done with the seeds."