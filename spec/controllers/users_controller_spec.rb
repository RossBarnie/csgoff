require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
    context "with valid Steam authentication information" do
      it 'assigns a user to @user'
      it 'creates a user on session'
      it 'redirects to user profile'
    end
    context "with invalid Steam authentication information" do
      it 'does not assign @user'
      it 'does not create a user on the session'
      it 'redirects to home page'
    end
  end

  describe "GET 'show'" do
    context 'as a logged in user, not the current user'
    context 'as a not logged in user'
    context 'as the user who is currently logged in'
  end

end
