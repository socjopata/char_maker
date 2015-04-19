class Fightstyle
  @init: ->
    $('#main').on 'click', '#next_step', ->
      fightsyles = $('input[name=\'fight_style_id\']')
      wieldstyles = $('input[name=\'wield_style_id\']')
      if fightsyles.filter(':checked').length == 0 or wieldstyles.filter(':checked').length == 0
        alert 'Musisz wybrać styl walki, zanim będziesz mógł przejść dalej.'
      else
        $('form').submit()

    $('#first_tooltip').tooltip
      html: true
      placement: 'left'
      title: ->
        $('#stats_qtip_table').html()

window.Fightstyle = Fightstyle