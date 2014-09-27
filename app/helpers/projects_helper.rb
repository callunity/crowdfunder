module ProjectsHelper

	def end_date_display
    self.end_date.to_time.strftime('%A, %B %e, %Y')
  end

  def start_date_display
    self.start_date.to_time.strftime('%A, %B %e, %Y')
  end

end
