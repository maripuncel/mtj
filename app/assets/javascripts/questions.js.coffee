# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#add-answer').click (e) ->
    e.preventDefault()
    content = $('#answer-content').val()
    question = $('#answer-question').val()
    query = 'content=' + content + '&question=' + question
    url = 'http://localhost:3000/add/answer'
    $.ajax
      type: 'POST'
      url: url
      data: query
      success: (data, code, xmlhttp) ->
        window.location = xmlhttp.responseText