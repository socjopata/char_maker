# -*- encoding : utf-8 -*-
module NameWithPrice

  def name_with_price
    "#{name} - #{(sprintf('%0.1f', (price.to_f / 100))).to_s.gsub(".", ",")} #{I18n.t('gold', :count => (price.to_f / 100).round)} złota"
  end

end

