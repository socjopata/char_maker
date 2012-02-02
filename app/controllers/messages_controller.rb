# -*- encoding : utf-8 -*-

class MessagesController < ApplicationController
  include SimpleCaptcha::ControllerHelpers

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid? && (simple_captcha_valid? or current_user)
      AlantarMailer.contact_us(@message).deliver
      flash[:notice] = "Wiadomość wysłana! Dzięki za kontakt."
      redirect_to root_url
    else
      flash[:alert] = "Coś poszło nie tak jak powinno. Napewno przepisałeś poprawnie kod z obrazka?"
      render :action => 'new'
    end
  end





end
