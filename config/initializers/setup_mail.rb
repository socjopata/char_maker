# -*- encoding : utf-8 -*-
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "alantar.com",
  :user_name            => "alantar",
  :password             => "secret",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
