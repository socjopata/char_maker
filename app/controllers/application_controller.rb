# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  include ExceptionLogger::ExceptionLoggable
  rescue_from Exception, with: :log_exception_handler

  protect_from_forgery

  before_filter :set_cache_buster

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end