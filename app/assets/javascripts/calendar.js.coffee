# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  select = (start, end, allDay) ->
    title = window.prompt("title")
    data = {event: {title: title, start: start.toString(), end: end.toString(), allDay: true, color: "red"}}
    $.ajax({
      type: "POST",
      url: "/events",
      data: data
      success: ->
        calendar.fullCalendar('refetchEvents')
    })
    calendar.fullCalendar('unselect')

  calendar = $('#calendar').fullCalendar({
    events: '/events.json',
    selectable: true,
    selectHelper: true,
    ignoreTimezone: false,
    editable: true,
    disableDragging: true,
    select: select

    # カレンダーのイベントクリック時に呼び出す処理
    eventClick: (calEvent, jsEvent, view) ->
      # クリックしたイベントを削除する
      $('#calendar').fullCalendar('removeEvents', calEvent._id);


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
  })

