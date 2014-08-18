class SessionController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:callback]

  def callback
      # handles Steam user information
      auth = request.env['omniauth.auth']
      new_user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.image = auth.info['image']
        u.nickname = auth.info['nickname']
      end
      session[:current_user] = new_user

      # Inspect Steam info with this, will have to comment out redirect ofc
      # render :text => request.env["omniauth.auth"].to_hash.inspect
      redirect_to root_url

  end

  def destroy
    session[:current_user] = nil
    redirect_to root_url
  end

end
