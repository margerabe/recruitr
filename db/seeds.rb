puts "Destroying existing records..."

Position.destroy_all

puts "Creating positions"

Position.create(title: "Frontend Engineer")
Position.create(title: "Marketing Content Manager")
Position.create(title: "Mobile Developer")
Position.create(title: "Backend Intern")

puts "Positions created!"
