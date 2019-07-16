# frozen_string_literal: true

# application controller
class ApplicationController < ActionController::Base
  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = 'Please log in.'
      redirect_to(access_login_path)
    end
  end

  def _user_id
    session[:user_id]
  end
end
