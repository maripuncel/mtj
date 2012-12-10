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
      success: (data) ->
        $('#accordian').append(data)
        $('#question-content').val('').change()
        $('#accordian').accordion('destroy')
        $('#accordian').accordion
          collapsible: true
          autoHeight: false
          active: false
        $('#accordian').accordion('option', 'active', ':last')
        $('#question').removeClass('in')
        $('#question').css('height', 0)
      error:(XMLHttpRequest, testStatus, errorThrown) ->

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
    active: false

$ ->
    $('.new_answer').click ->
      button = this
      answer_content = $(button).siblings('[name="answer_content"]').val()
      answer_question = $(button).attr('id')
      if (answer_content != "")
        $.ajax
          type:'POST',
          url:'/questions/create_answer?answer_content=' + answer_content + '&answer_question=' + answer_question,
          dataType:'html',
          success: (data) ->
            $('#'+answer_question).append(data)
            $(button).siblings('[name="answer_content"]').val('Your answer...').change()
          error:(XMLHttpRequest, testStatus, errorThrown) ->

$ ->
      $('.voting_up').click ->
        button = this
        question_id = $(button).attr('id')
        $.ajax
          type: 'POST',
          url: '/questions/upvote/' + question_id,
          dataType: 'html'
          success: (data) ->
            alert(button)
            $(button).attr('class','voting_down')
            $('#vote_count'+question_id).replaceWith(data)
          error:(XMLHttpRequest, testStatus, errorThrown) ->

$ ->
      $('.voting_down').click ->
        button = this
        question_id = $(button).attr('id')
        $.ajax
          type: 'POST',
          url: '/questions/downvote/' + question_id,
          dataType: 'html'
          success: (data) ->
            alert('youre a dumb bitch')
            $(button).attr('class','voting_up')
            alert('youre a dumb bitch')
            $('#vote_count'+question_id).replaceWith(data)
          error:(XMLHttpRequest, testStatus, errorThrown) ->

