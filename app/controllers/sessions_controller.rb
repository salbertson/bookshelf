class SessionsController < ApplicationController
  skip_before_filter :authorize_user

  def new
  end

  def create
    user = User.find_or_create_by(username: username) do |user|
      user.email = email
    end

    if user.persisted?
      session['username'] = username

      redirect_to root_path
    else
      head 401
    end
  end

  def delete
    session['username'] = nil
    redirect_to root_path
  end

  private

  def username
    env['omniauth.auth']['info']['nickname']
  end

  def email
    env['omniauth.auth']['info']['email']
  end
end
