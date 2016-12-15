# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# opportunities
homeless = Opportunity.find_or_create_by(name: "Homeless Services")
aging = Opportunity.find_or_create_by(name: "Aging Services")
keep = Opportunity.find_or_create_by(name: "Keep Tampa Bay Beautiful")
veterans = Opportunity.find_or_create_by(name: "Veterans Park & Museum")
parks_rec = Opportunity.find_or_create_by(name: "Parks (Recreation Centers)")
parks_clean = Opportunity.find_or_create_by(name: "Parks (Cleanup)")
parks_admin = Opportunity.find_or_create_by(name: "Parks (Administrative/Office Assistant)")
pets = Opportunity.find_or_create_by(name: "Pet Resource Center")
children = Opportunity.find_or_create_by(name: "Children Services")
head_satrt = Opportunity.find_or_create_by(name: "Head Start/Early Head Start")

# questons
Question.find_or_create_by(content: "Which method of volunteering are you able to do?") do |q|
	# 1
	q.answers << Answer.create(content: "Time")
	q.answers << Answer.create(content: "Donation of money or items")
	q.answers << Answer.create(content: "Share this quiz")
	q.answers << Answer.create(content: "Any of the Above")
end
Question.find_or_create_by(content: "You would like to donate money or items. Please select your favorite options.") do |q|
	# 2
	q.answers << Answer.create(content: "Money")
	q.answers << Answer.create(content: "Items")
end
Question.find_or_create_by(content: "Which group are you most passionate about?") do |q|
	# 3
	q.answers << Answer.create(content: "People")
	q.answers << Answer.create(content: "Animals")
	q.answers << Answer.create(content: "Nature / Ecology")
	q.answers << Answer.create(content: "Administrative / Office Tasks")
	q.answers << Answer.create(content: "People & Animals")
	q.answers << Answer.create(content: "Any of the above")
end
Question.find_or_create_by(content: "Which is most important to you?") do |q|
	# 4
	q.answers << Answer.create(content: "Kids")
	q.answers << Answer.create(content: "Seniors")
	q.answers << Answer.create(content: "At-risk (homeless, shelter animals, etc.)")
	q.answers << Answer.create(content: "Ecology (lakes, rivers, ponds, landscaping)")
	q.answers << Answer.create(content: "Kids & Seniors")
	q.answers << Answer.create(content: "Any of the above")
end
Question.find_or_create_by(content: "Volunteering might require physical demands. Which one of the following are you able to do?") do |q|
	# 5
	q.answers << Answer.create(content: "Continuous sitting or standing (extended durations)")
	q.answers << Answer.create(content: "Light activity (walking, bending, kneeling)")
	q.answers << Answer.create(content: "Moderate activity (dancing, digging, lifting light weight)")
	q.answers << Answer.create(content: "Strenuous activity (running, jumping, throwing, lifting heavier weight)")
	q.answers << Answer.create(content: "Any of the above")
end
Question.find_or_create_by(content: "Do you prefer to help on a one-on-one basis, or be part of a larger group?") do |q|
	# 6
	q.answers << Answer.create(content: "Single Person Team (skips Team Leader question)")
	q.answers << Answer.create(content: "Small Team (2)")
	q.answers << Answer.create(content: "Medium Team (3-5)")
	q.answers << Answer.create(content: "Large Team (5+)")
	q.answers << Answer.create(content: "Any of the above")
end
Question.find_or_create_by(content: "Which do you prefer?") do |q|
	# 7
	q.answers << Answer.create(content: "Lead a team")
	q.answers << Answer.create(content: "Team member only")
end
Question.find_or_create_by(content: "Where would you rather voluteer?") do |q|
	# 8
	q.answers << Answer.create(content: "Indoors (primarily)")
	q.answers << Answer.create(content: "Outside (primarily)")
	q.answers << Answer.create(content: "Either of the above")
end
Question.find_or_create_by(content: "Some volunteering involves getting dirty. Which is your preference?") do |q|
	# 9
	q.answers << Answer.create(content: "I must remain clean")
	q.answers << Answer.create(content: "I would like to stay as clean as I can, but understand it's possible I may get dirty")
	q.answers << Answer.create(content: "I'm fine with getting dirty")
	q.answers << Answer.create(content: "Any of the Above")
end
Question.find_or_create_by(content: "Select the verbal style you are most comfortable with.") do |q|
	# 10
	q.answers << Answer.create(content: "I love to teach and instruct")
	q.answers << Answer.create(content: "I enjoy talking to people")
	q.answers << Answer.create(content: "I enjoy telling stories and presenting")
	q.answers << Answer.create(content: "I prefer not working directly with people")
	q.answers << Answer.create(content: "Any of the Above")
end
Question.find_or_create_by(content: "Select the level of activity that suits you best.") do |q|
	# 11
	q.answers << Answer.create(content: "I love to play table games")
	q.answers << Answer.create(content: "I love sports and activities")
	q.answers << Answer.create(content: "I don't enjoy games and contests")
	q.answers << Answer.create(content: "Any of the Above")
end
Question.find_or_create_by(content: "Select the type of activity that interests you most.") do |q|
	# 12
	q.answers << Answer.create(content: "I enjoy office tasks (paperwork, filing, spreadsheets, etc.)")
	q.answers << Answer.create(content: "I enjoy making our County more beautiful")
	q.answers << Answer.create(content: "I'm very handy (build, paint, plant)")
	q.answers << Answer.create(content: "I prefer talking or instructing people")
	q.answers << Answer.create(content: "Any of the Above")
end
Question.find_or_create_by(content: "Some volunteering may require training, certification, or screening. Select the option you are willing to do.") do |q|
	# 13
	q.answers << Answer.create(content: "I prefer to do something that doesn't require training")
	q.answers << Answer.create(content: "I'm willing to be trained")
	q.answers << Answer.create(content: "I'm willing to get certified as an instructor")
	q.answers << Answer.create(content: "I'm willing to submit to background screenings")
	q.answers << Answer.create(content: "I'm willing to do all of the above")
end
Question.find_or_create_by(content: "What is your preferred time commitment?") do |q|
	# 14
	q.answers << Answer.create(content: "I'll volunteer when I can")
	q.answers << Answer.create(content: "I want to volunteer for a signe event")
	q.answers << Answer.create(content: "I'm willing to commit to regular volunteering")
end
Question.find_or_create_by(content: "I have a specialized skill such as medical expertise, which I am willing to share.") do |q|
	# 15
	q.answers << Answer.create(content: "Yes")
	q.answers << Answer.create(content: "No")
end
