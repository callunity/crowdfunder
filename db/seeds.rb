10.times do |i|

  Project.create({
    name: "Project #{i}",
    description: "It's number #{i}!",
    goal: "#{i}00",
    start_date: (2.days.ago),
    end_date: (Time.now + 2.days)
  })
end