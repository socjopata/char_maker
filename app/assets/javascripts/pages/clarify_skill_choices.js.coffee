class ClarifySkillChoices
  @init: ->
    $('#main').on 'click', '.append_to_form_and_submit', (event) ->
      url = Routes.toggle_weapon_proficiency_character_wizard_path()
      data =
        'name': $(event.target).val()
        'value': $(event.target).is(':checked')
        'char_id': $('#char_id').data('char-id')
      $.ajax
        url: url
        data: data
        dataType: 'script'

window.ClarifySkillChoices = ClarifySkillChoices
