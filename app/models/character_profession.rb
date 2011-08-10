# -*- encoding : utf-8 -*-
class CharacterProfession < ActiveRecord::Base
  belongs_to :character
  belongs_to :profession
end
