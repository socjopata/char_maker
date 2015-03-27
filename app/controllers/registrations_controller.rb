# -*- encoding : utf-8 -*-
class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication

  def new
    if current_user.blank?
      resource = build_resource({})
      render "devise/registrations/new"
    else
      self.resource = current_user
      render "devise/registrations/edit"
    end
  end

  def create
    super
  end

  def update
    if current_user
      params[:user].delete(:current_password)
      if current_user.update_attributes(params[:user])
        sign_in(:user, current_user, bypass: true)    #a bypass gotcha
        redirect_to home_index_path, notice: "Rejestracja przebiegła pomyślnie!"
      else
        respond_with current_user
      end
    else
      super
    end
  end
end