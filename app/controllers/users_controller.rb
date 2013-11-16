class UsersController < ApplicationController
  def sign_out
    
    reset_session
    redirect_to :action=>'sign_in'
  end
end
