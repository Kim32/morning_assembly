require 'open-uri'

class CalendarController < ApplicationController
  def index
  end

  def modal
    @staff = Staff.select("name")
  end

  # def holiday
  #   year_month = "2016-01".to_time
  #   calendar_id = 'ja.japanese#holiday@group.v.calendar.google.com'
  #   uri = "https://www.googleapis.com/calendar/v3/calendars/#{CGI.escape(calendar_id)}/events?" +
  #       "orderBy=startTime&singleEvents=true&timeZone=Asia%2FTokyo&timeMin=#{CGI.escape(year_month.iso8601)}&" +
  #       "timeMax=#{CGI.escape(year_month.end_of_month.iso8601)}&key=#{CGI.escape(Settings.google_api_key)}"
  #   result = JSON.parse(open(uri).read)
  #   result['items'].map{|v| v["start"]["date"].to_date}
  # end
end
