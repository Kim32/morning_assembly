# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  select = (start) ->
    if(dayClick(start))
      document.getElementById('event[start]').value=start;
      $('#myModal').modal {}

  deleteEvent = (calEvent, revertFunc) ->
    if flag(calEvent)
      if window.confirm("削除しますか?")
        url = "/events/" + calEvent.id
        data = {_method: 'DELETE'}
        $.ajax({
          type: "POST",
          url: url,
          data: data,
          success: ->
            calendar.fullCalendar("refetchEvents")
          error: revertFunc
        })

  dayClick = (start) ->
    events = $('#calendar').fullCalendar('clientEvents');
    for event in events
      if(event.start >= start && event.start < start + 1)
        return false
    return true

  flag = (calEvent) ->
    for event in gon.events
      if(event.id == calEvent.id)
        if(event.category == "human")
          return true
    return false

  calendar = $('#calendar').fullCalendar({
    events: {
      url: '/events',
      success:(events) ->
        $(events).each ->
          this.url = null
    },
    selectable: true,
    selectHelper: true,
    gnoreTimezone: false,
    select: select,
    eventClick: deleteEvent,
    eventMouseover: (calEvent) ->
      if flag(calEvent)
        $(this).addClass("can_delete")
        $(this).css("cursor","pointer");

    eventMouseout: ->
      $(this).removeClass("can_delete")

    titleFormat:
      month: 'YYYY年 MMMM'
    monthNames: [
      '１月'
      '２月'
      '３月'
      '４月'
      '５月'
      '６月'
      '７月'
      '８月'
      '９月'
      '１０月'
      '１１月'
      '１２月'
    ]
    dayNamesShort: [
      '日'
      '月'
      '火'
      '水'
      '木'
      '金'
      '土'
    ]
    buttonText:
      today: '今日'

    weekends: false

  })