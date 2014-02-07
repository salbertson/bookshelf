class SessionsController < ApplicationController
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

  private

  def username
    env['omniauth.auth']['info']['nickname']
  end

  def email
    env['omniauth.auth']['info']['email']
  end
end
