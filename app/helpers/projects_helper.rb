module ProjectsHelper

	def date_display(date)
    date.to_time.strftime('%A, %B %e, %Y')
  end

end
