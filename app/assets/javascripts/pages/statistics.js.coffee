class Statistics
  @init: ->
    $('#main').on 'click', '#next_step', ->
      $('div#user_stats_form #statistics_strength').val $('#strength').text()
      $('div#user_stats_form #statistics_dexterity').val $('#dexterity').text()
      $('div#user_stats_form #statistics_endurance').val $('#endurance').text()
      $('div#user_stats_form #statistics_intelligence').val $('#intelligence').text()
      $('div#user_stats_form #statistics_faith').val $('#faith').text()
      $('div#user_stats_form #statistics_polish').val $('#polish').text()
      $('div#user_stats_form #user_stats_form').submit()

    $('.drag').draggable
      containment: '#display_container'
      revert: true
      revertDuration: 750

    $('.drop').droppable
      accept: '.drag'
      hoverClass: 'active'
      drop: (event, props) ->
        $(this).text $(props.draggable).text()
        $(props.draggable).hide()

  @reset_stat_fields = ->
    $('.ui-draggable').show()
    $('.drop').not('.lead').text ''


window.Statistics = Statistics