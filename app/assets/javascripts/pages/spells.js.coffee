class Spells
  @init: ->
    $('#main').on 'click', '.toggle_this_spell', (event) ->
      spell_id = $(event.target).attr('id')
      field_value = $(event.target).prop('checked')
      char_id = $('#char_id').data('char-id')
      url = Routes.toggle_spell_character_wizard_path()
      data =
        'spell_id': spell_id
        'value': field_value
        'char_id': char_id
      $.ajax
        url: url
        data: data
        dataType: 'script'

window.Spells = Spells