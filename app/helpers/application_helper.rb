# -*- encoding : utf-8 -*-
module ApplicationHelper
  def step_progress(wizard)
    if wizard
      if wizard.character.profession && wizard.character.is_of_scholar_class_type?
        ((wizard.step_number.to_f / Wizard::SCHOLAR_STEPS.to_f) * 100).round
      else
        ((wizard.step_number.to_f / Wizard::REGULAR_STEPS.to_f) * 100).round
      end
    else
      0
    end
  end

  def render_home_partial(page)
    case page
      when "about"
        render partial: 'home/about'
      else
        render text: "#TODO"
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
end