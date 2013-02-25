# -*- encoding : utf-8 -*-
module ApplicationHelper

  def step_progress(wizard)
    if wizard.character.profession && wizard.character.is_of_scholar_class_type?
      "Pozostało kroków: ~#{Wizard::SCHOLAR_STEPS - wizard.step_number}"
    else
      "Pozostało kroków: ~#{Wizard::REGULAR_STEPS - wizard.step_number}"
    end
  end

  def render_home_partial(page)
    case page
      when "about" then
        render :partial => 'home/about'
      else
        render :text => "#TODO"
    end
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
