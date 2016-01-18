class CalendarController < ApplicationController
  before_action :exist_file, only: :index

  def index
    @staff = Staff.select('name')
    puts @exist
    gon.events = Event.all
  end
end