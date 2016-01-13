class CalendarController < ApplicationController
  def index
    @staff = Staff.select("name")
  end

  def modal
    @staff = Staff.select("name")
  end

end
