class DashboardController < ApplicationController
  def index
  	@title = "Bonjour, #{current_user.first_name}"
  	@subtitle = '<strong>mmi teach</strong> | L\'outil d\'organisation des enseignements de MMI Bordeaux'
    @semesters = Semester.all
    @year = Year.current
    @projects = @year.projects_with_user_involved current_user
    @projects_in_charge = @year.projects.where(user: current_user)
    @teaching_modules = @year.planned_teaching_modules_for current_user
  end
end