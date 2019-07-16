# frozen_string_literal: true

# access controller
class AccessController < ApplicationController
  before_action :confirm_logged_in, except: %i[login attempt_login logout]

  def menu
    @username = session[:username]
  end

  def login; end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user
        @authorized_user = found_user
                           .authenticate(params[:password])
      end
    end

    @authorized_user ? check_true_al : check_false_al
  end

  def check_true_al
    session[:user_id] = @authorized_user.id
    session[:username] = @authorized_user.name
    flash[:notice] = 'You are now logged in.'
    redirect_to(admin_path)
  end

  def check_false_al
    flash.now[:notice] = 'Invalid username/password combination.'
    render('login')
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = 'Logged out'
    redirect_to(access_login_path)
  end
end
