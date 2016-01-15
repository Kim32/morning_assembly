class CalendarController < ApplicationController
  def index
    @staff = Staff.select('name')

    file_names = Dir.glob('config/*.yml')
    @exist = false
    file_names.each do |file_name|
      @exist = true if(file_name == 'config/settings.local.yml')
    end

    gon.events = Event.all
  end
end
