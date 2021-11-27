# frozen_string_literal: true

puts 'Destroying existing records...'
Interview.destroy_all
Candidate.destroy_all
Position.destroy_all
Recruiter.destroy_all
Skill.destroy_all

puts 'Creating positions...'
position = Position.create(title: 'Full Stack Engineer')
position1 = Position.create(title: 'Frontend Engineer')
puts 'Positions created!'

puts 'Creating candidates...'
candidate = Candidate.create(first_name: 'Raphaël', last_name: 'Marsan', email: 'marsanraphael@gmail.com',
                             position: position)
candidate2 = Candidate.create(first_name: 'Jean-Luc', last_name: 'Leclerc', email: 'jlleclerc123456789@gmail.com',
                              position: position1)

puts 'Creating recruiters...'
recruiter = Recruiter.create(first_name: 'Jean-Marie', last_name: 'Leduc', email: 'jleduc123456789@gmail.com')
Recruiter.create(first_name: 'Harold', last_name: 'Jardin', email: 'hjardin123456789@gmail.com')
Recruiter.create(first_name: 'Sébastien', last_name: 'Paulus', email: 'spaulus123456789@gmail.com')
puts 'Recruiters created!'

puts 'Creating skills...'
Skill.create(name: 'Marketing')
Skill.create(name: 'Javascript')
Skill.create(name: 'Ruby')
Skill.create(name: 'Coffeescript')
puts 'Skills created!'

puts 'Creating interviews...'
Interview.create(start_time: DateTime.new(2022, 1, 15, 10, 0, 0), end_time: DateTime.new(2022, 1, 15, 11, 0, 0),
                 candidate: candidate, recruiter: recruiter)
# The same recruiter has a second interview a month later
Interview.create(start_time: DateTime.new(2022, 2, 15, 10, 0, 0), end_time: DateTime.new(2022, 2, 15, 11, 0, 0),
                 candidate: candidate2, recruiter: recruiter)
puts 'Interviews created!'

puts 'All done with the seeds.'
