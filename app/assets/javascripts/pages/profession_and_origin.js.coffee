class ProfessionAndOrigin
  @init: ->
    $('#professions').change ->
      char_id = $('#character_id').data('character-id')
      profession = $('select#professions :selected').val()
      if profession == ''
        profession = '0'
      jQuery.get '/character_wizard/update_countries_select', {
        'id': profession
        'char_id': char_id
      }, (data) ->
        $('#addressCountries').html data
        return
      false

    $('#main').on 'change', '#countries', ->
      char_id = $('#character_id').data('character-id')
      country = $('select#countries :selected').val()
      profession = $('select#professions :selected').val()
      if country == ''
        country = '0'
      jQuery.get '/character_wizard/update_deities_select', {
        'id': country
        'char_id': char_id
        'profession_id': profession
      }, (data) ->
        $('#addressDeities').html data
        return
      false

    $('#main').on 'change', '#deities', ->
      deity_text = $('span#' + $('select#deities :selected').text()).text()
      $('#deity_description').text ' ' + deity_text
      false

    $('#main').on 'click', '#next_step', ->
      $("form").submit();

window.ProfessionAndOrigin = ProfessionAndOrigin