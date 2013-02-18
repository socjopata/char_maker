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


  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  #Use the view helper in a form like this:
  #
  #<%= simple_form_for ... %>
  #<%= f.error_notification %>
  #<%= display_base_errors resource %>
  #                              .
  #                              .
  #                              .
  # <% end %>


end
