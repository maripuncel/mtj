# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#root_url = 'http://localhost:3000'
root_url = 'http://vast-dusk-2147.herokuapp.com'
$ ->
  $('#add-answer').click (e) ->
    e.preventDefault()
    content = $('#answer-content').val()
    question = $('#answer-question').val()
    company = $('#answer-company').val()
    query = 'content=' + content + '&question=' + question + '&company=' + company
    url = root_url + '/add/answer'
    $.ajax
      type: 'POST'
      url: url
      data: query
      success: (data, code, xmlhttp) ->
        window.location = xmlhttp.responseText

$ ->
  $('#accordian').accordion
    collapsible: true

