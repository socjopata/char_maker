class Skills
  @init: ->
    $('a.skill_qtip').tooltip
      html: true
      placement: 'right'

    $('#main').on 'click', '.toggle_this_skill', (event) ->
      skill_id = $(event.target).attr('id')
      field_value = $(event.target).checked
      char_id = $('#char_id').data('char-id')
      url = Routes.toggle_skill_character_wizard_path()
      data =
        'skill_id': skill_id
        'value': field_value
        'char_id': char_id
      $.ajax
        url: url
        data: data
        dataType: 'script'

window.Skills = Skills