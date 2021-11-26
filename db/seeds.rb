puts "Destroying existing records..."
Interview.destroy_all
Candidate.destroy_all
Position.destroy_all
Recruiter.destroy_all
Skill.destroy_all

puts "Creating positions..."
position = Position.create(title: "Full Stack Engineer")
position1 = Position.create(title: "Frontend Engineer")
position2 = Position.create(title: "Marketing Content Manager")
position3 = Position.create(title: "Mobile Developer")
position4 = Position.create(title: "Backend Intern")
puts "Positions created!"

puts "Creating candidates..."
candidate = Candidate.create(first_name: "Raphaël", last_name: "Marsan", email: "marsanraphael@gmail.com", position: position)
candidate2 = Candidate.create(first_name: "Jean-Marie", last_name: "Leduc", email: "jleduc@gmail.com", position: position1)
candidate3 = Candidate.create(first_name: "Claude", last_name: "Dufonsny", email: "cdufonsny@gmail.com", position: position2)
candidate4 = Candidate.create(first_name: "Arthur", last_name: "Dupont", email: "adupont@gmail.com", position: position3)
candidate5 = Candidate.create(first_name: "Fernand", last_name: "Lelob", email: "flelob@gmail.com", position: position4)
puts "Candidates created!"

puts "Creating recruiters..."
recruiter = Recruiter.create(first_name: "Jean-Marie", last_name: "Leduc", email: "jleduc@gmail.com")
recruiter2 = Recruiter.create(first_name: "Claude", last_name: "Dufonsny", email: "cdufonsny@gmail.com")
recruiter3 = Recruiter.create(first_name: "Arthur", last_name: "Dupont", email: "adupont@gmail.com")
recruiter4 = Recruiter.create(first_name: "Fernand", last_name: "Lelob", email: "flelob@gmail.com")
puts "Recruiters created!"

puts "Creating skills..."
Skill.create(name: "Marketing")
Skill.create(name: "Javascript")
Skill.create(name: "Ruby")
Skill.create(name: "Coffeescript")
puts "Skills created!"

puts "Creating interviews..."
Interview.create(start_time: DateTime.new(2022, 1, 15, 10, 0, 0), end_time: DateTime.new(2022, 1, 15, 11, 0, 0), candidate: candidate, recruiter: recruiter)
# The same recruiter has a second interview a month later
Interview.create(start_time: DateTime.new(2022, 2, 15, 10, 0, 0), end_time: DateTime.new(2022, 2, 15, 11, 0, 0), candidate: candidate2, recruiter: recruiter)
puts "Interviews created!"

puts "All done with the seeds."