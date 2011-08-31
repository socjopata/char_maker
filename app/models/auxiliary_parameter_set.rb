# -*- encoding : utf-8 -*-
class AuxiliaryParameterSet < ActiveRecord::Base
  belongs_to :character

  #TODO store base parameters for social classes in static vars
  #TODO make a migration
  #TODO think about more elegant way


end
