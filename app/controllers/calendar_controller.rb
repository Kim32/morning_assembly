class CalendarController < ApplicationController
  before_action :exist_file, only: :index

  def index
    @staff = Staff.select('name')
    gon.events = Event.all
  end
end