class ApplicationController < ActionController::Base
  layout 'layouts/application'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def main
  end
end
