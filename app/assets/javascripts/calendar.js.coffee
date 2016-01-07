# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  select = (start, allDay) ->
    title = window.showModalDialog("/calendar/modal")
    if title != null
      data = {event: {title: title, start: start.toString(), end: start.toString(), allDay: true, color: "green"}}
      $.ajax({
        type: "POST",
        url: "/events",
        data: data
        success: ->
          calendar.fullCalendar('refetchEvents')
      })
      calendar.fullCalendar('unselect')

  deleteEvent = (event, revertFunc) ->
    if window.confirm("削除しますか?")
      url = "/events/" + event.id
      data = {_method: 'DELETE'}
      $.ajax({
        type: "POST",
        url: url,
        data: data,
        success: ->
          calendar.fullCalendar("refetchEvents")
        error: revertFunc
      })

  calendar = $('#calendar').fullCalendar({
    events: {
      url: '/events',
      success:(events) ->
        $(events).each ->
          this.url = null
    },
    selectable: true,
    selectHelper: true,
    ignoreTimezone: false,
    select: select,
    eventClick: deleteEvent,

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

    weekends: true
  })