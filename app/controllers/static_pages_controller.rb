class StaticPagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:callback]

  def home
  end

  def about
  end

  def callback
      # handles Steam user information
      # TODO: move function to a session controller
      auth = request.env['omniauth.auth']
      session[:current_user] = {
          :nickname => auth.info['nickname'],
          :image => auth.info['image'],
          :uid => auth.uid
          }

      # Inspect Steam info with this, will have to comment out redirect ofc
      # render :text => request.env["omniauth.auth"].to_hash.inspect
      redirect_to root_url

  end

end
