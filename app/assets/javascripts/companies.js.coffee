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
    position = $('#interview-position').text()
    query = 'content=' + content + '&company=' + company + '&questions=' + questions + '&rating=' + rating + '&position=' + position
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
    position = $('#offer-position').val()
    query = 'figure=' + figure + '&company=' + company + '&position=' + position
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

$ ->
  $('div.btn-group[data-toggle-name=pos]').each ->
    group = $(this)
    form = $('#interview-position')
    $('button', group).each ->
      button = $(this)
      button.live('click', ->
        form.text($(this).val())
        form.val(form.text()))
      if(button.val() == form.val())
        button.addClass('active')

$ ->
  $('div.btn-group[data-toggle-name=checkbox]').each ->

    $('button', $(this)).each ->
      position = $(this).text()
      all_pos = ["Developer", "Project Manager", "Trader", "Consultant", "Analyst", "Researcher"]
      $(this).live('click', ->
        if($(this).hasClass('active'))
          $(this).removeClass('active')
          elements = document.getElementsByName(position)
          e_array = $.makeArray(elements)
          $(e_array).each ->
            element = $(this)
            $(element).hide()
        else
          $(this).addClass('active')
          elements = document.getElementsByName(position)
          e_array = $.makeArray(elements)
          $(e_array).each ->
            element = $(this)
            $(element).show())

$ ->
  $('#accordian').accordion
    collapsible: true
    autoHeight: false








