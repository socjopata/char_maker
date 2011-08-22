class LeadParameter < ActiveRecord::Base
  belongs_to :profession

  def display_name
    Statistics::NAMES[name]
  end
end
