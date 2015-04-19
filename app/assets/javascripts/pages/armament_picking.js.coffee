class ArmamentPicking
  @init: ->
      $('select').val ''
      $('#weapon_group').change ->
        char_id = $('#char_id').data('char-id')
        weapon_group = $('select#weapon_group :selected').val()
        if weapon_group == ''
          weapon_group = '0'
        $.get '/character_wizard/update_weapons_select', {
          'weapon_group': weapon_group
          'char_id': char_id
        }, (data) ->
          $('#weapons').html data
        false
      $('#armor_group').change ->
        char_id = $('#char_id').data('char-id')
        armor_group = $('select#armor_group :selected').val()
        if armor_group == ''
          armor_group = '0'
        $.get '/character_wizard/update_armors_select', {
          'armor_group': armor_group
          'char_id': char_id
        }, (data) ->
          $('#armors').html data
        false
      $('#shield_group').change ->
        char_id = $('#char_id').data('char-id')
        shield_group = $('select#shield_group :selected').val()
        if shield_group == ''
          shield_group = '0'
        $.get '/character_wizard/update_shields_select', {
          'shield_group': shield_group
          'char_id': char_id
        }, (data) ->
          $('#shields').html data
        false
      $('#ranged_weapon_group').change ->
        char_id = $('#char_id').data('char-id')
        ranged_weapon_group = $('select#ranged_weapon_group :selected').val()
        if ranged_weapon_group == ''
          ranged_weapon_group = '0'
        $.get '/character_wizard/update_ranged_weapons_select', {
          'ranged_weapon_group': ranged_weapon_group
          'char_id': char_id
        }, (data) ->
          $('#ranged_weapons').html data
        false

window.ArmamentPicking = ArmamentPicking    
