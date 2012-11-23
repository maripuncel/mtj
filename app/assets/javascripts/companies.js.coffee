# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#add-interview').click (e) ->
    e.preventDefault()
    content = $('#interview-content').val()
    company = $('#interview-company').val()
    query = 'content=' + content + '&company=' + company
    url = 'http://localhost:3000/add/interview'
    $.ajax
      type: 'POST'
      url: url
      data: query
      success: (data, code, xmlhttp) ->
        window.location = xmlhttp.responseText