# -*- encoding : utf-8 -*-
class LeadParameter < ActiveRecord::Base
  belongs_to :profession

  def display_name
    Statistics::POLISH_NAMES[name]
  end
end
