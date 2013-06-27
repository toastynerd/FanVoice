# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->   
  $('.datetime').datetimepicker
    dateFormat: 'yy-mm-dd'
    timeFormat: 'hh:mm:ss tt'
    minDate: 0
    stepHour: 4
    stepMinute: 2
