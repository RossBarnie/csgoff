class UsersController < ApplicationController
  before_action :require_login, only: [:destroy, :show]
  skip_before_action :verify_authenticity_token, only: [:new]

  def new
    # handles Steam user information
    if request.env['omniauth.auth'].present?
      auth = request.env['omniauth.auth']
      user = User.find_or_create_by(uid: auth['uid']) do |u|
        # TODO: validate
        u.image = auth.info['image']
        u.nickname = auth.info['nickname']
        u.logged_in = true
      end
      session[:current_user] = user
    else
      flash[:error] = "Unable to retrieve information from Steam"
    end
  end

  def show
  end

  def destroy
  end

  private

  def require_login
    unless @user.logged_in
      flash[:error] = "You must be logged in to access this page"
      redirect_to root_url
    end
  end

end
