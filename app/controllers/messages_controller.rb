# -*- encoding : utf-8 -*-

class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      AlantarMailer.contact_us(@message).deliver
      flash[:notice] = "Wiadomość wysłana! Dzięki za kontakt."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end





end
