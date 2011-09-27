# -*- encoding : utf-8 -*-
module ApplicationHelper

  def button_link_to(name, url, opts = {})
    link_class = "button"
    opts[:class].nil? ? opts[:class] = link_class : opts[:class] = "#{link_class} #{opts[:class]}"
    _url = url_for(url)
    link_to(content_tag(:span, name), _url, opts)
  end

  def function_link_to(name, url, opts = {})
    link_class = "button"
    opts[:class].nil? ? opts[:class] = link_class : opts[:class] = "#{link_class} #{opts[:class]}"
    _url = url_for(url)
    link_to_function(content_tag(:span, name), _url, opts)
  end



end
