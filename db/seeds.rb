10.times do |i|

  Project.create({
    name: "Project #{i}",
    description: "It's number #{i}!",
    goal: "#{i}00",
    start_date: (2.days.ago),
    end_date: (Time.now + 2.days)
  })

  Tier.create({
  	project_id: i,
  	description: "First Tier",
  	amount: 500
	})

	Tier.create({
  	project_id: i,
  	description: "Second Tier",
  	amount: 1000
	})

	Tier.create({
  	project_id: i,
  	description: "Third Tier",
  	amount: 2000
	})

end