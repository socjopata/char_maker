# -*- encoding : utf-8 -*-
class AlantarMailer < ActionMailer::Base
  default from: "from@example.com"
  default to: "durgill@interia.pl"

  def contact_us(message)
      @content = message.content
      @email = message.email
      @name =  message.name
      mail(subject: "Wiadomość submitnięta poprzez formularz kontaktowy kreatora postaci")
  end
end