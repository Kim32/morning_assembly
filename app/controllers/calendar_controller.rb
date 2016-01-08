class CalendarController < ApplicationController
  def index
  end

  def modal
    @staff = Staff.select("name")
  end

end
