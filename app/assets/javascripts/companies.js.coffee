# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

root_url = 'http://localhost:3000'
#root_url = 'http://vast-dusk-2147.herokuapp.com'
$ ->
  $('#add-interview').click (e) ->
    e.preventDefault()
    content = $('#interview-content').val()
    company = $('#interview-company').val()
    questions = $('#interview-questions').val()
    rating = $('#interview-rating').val()
    query = 'content=' + content + '&company=' + company + '&questions=' + questions + '&rating=' + rating
    url = root_url + '/add/interview'
    $.ajax
      type: 'POST'
      url: url
      data: query
      success: (data, code, xmlhttp) ->
        window.location = xmlhttp.responseText

$ ->
  $('#add-offer').click (e) ->
    e.preventDefault()
    figure = $('#offer-figure').val()
    company = $('#offer-company').val()
    query = 'figure=' + figure + '&company=' + company
    url = root_url + '/add/offer'
    $.ajax
      type: 'POST'
      url: url
      data: query
      success: (data, code, xmlhttp) ->
        window.location = xmlhttp.responseText

$ ->
  $('#add-question').click (e) ->
    e.preventDefault()
    content = $('#question-content').val()
    company = $('#question-company').val()
    query = 'content=' + content + '&company=' + company
    url = root_url + '/add/question'
    $.ajax
      type: 'POST'
      url: url
      data: query
      success: (data, code, xmlhttp) ->
        window.location = xmlhttp.responseText

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
  $('#dialog-form').dialog(
    autoOpen:false
    height:150
    width:350
    modal:false
  )

$ ->
  $('#plus-icon').button()
    .click ->
      $('#dialog-form').dialog("open")

$ ->
  $('#dialog-form-i').dialog(
    autoOpen:false
    height:370
    width:350
    modal:false
  )

$ ->
  $('#plus-icon-i').button()
    .click ->
      $('#dialog-form-i').dialog("open")




