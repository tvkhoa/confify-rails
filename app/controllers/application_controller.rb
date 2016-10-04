class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_user_language
  after_filter :store_location

  private

  def set_user_language
    # I18n.locale = current_user.language if logged_in?
    I18n.locale = 'en'
  end

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (request.fullpath != "/users/login" &&
        request.fullpath != "/users/sign_up" &&
        request.fullpath != "/users/sign_out" &&
        request.fullpath != "/users/password" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    session[:previous_url] || (root_path + "admin")
  end

  def after_sign_out_path_for(resource_or_scope)
    session[:previous_url] || root_path
  end
end
