class Characters
  @new: ->
    $('#main').on 'click', '#next_step', ->
      $("form").submit();

window.Characters = Characters