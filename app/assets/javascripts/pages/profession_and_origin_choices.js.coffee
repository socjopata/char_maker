class ProfessionAndOriginChoices
  @init: ->
    $('#main').on 'click', '#next_step', ->
      $("form").submit();

window.ProfessionAndOriginChoices = ProfessionAndOriginChoices