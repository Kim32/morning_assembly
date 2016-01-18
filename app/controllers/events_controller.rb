require 'open-uri'

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :exist_file, only: :index

  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    if !params[:start].nil? && !params[:end].nil? && @exist
      holiday(params[:start], params[:end])
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to :controller => 'calendar', :action => 'index' }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def holiday(start_time, end_time)
    calendar_id = 'ja.japanese#holiday@group.v.calendar.google.com'
    uri = "https://www.googleapis.com/calendar/v3/calendars/#{CGI.escape(calendar_id)}/events?" +
      "orderBy=startTime&singleEvents=true&timeZone=Asia%2FTokyo&timeMin=#{CGI.escape(start_time.to_time.iso8601)}&" +
      "timeMax=#{CGI.escape(end_time.to_time.iso8601)}&key=#{CGI.escape(Settings.google_api_key)}"
    result = JSON.parse(open(uri).read)

    start = result['items'].map{|v| v['start']['date'].to_date}
    summary = result['items'].map{|v| v['summary']}

    i = 0
    start.each do |holiday_start|
      event = Event.new
      event.id = -1
      event.title = summary[i]
      event.start = holiday_start
      event.allDay = true
      event.color= 'red'
      event.category = 1
      @events << event
      i += 1
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :start, :end, :color, :allDay)
  end
end