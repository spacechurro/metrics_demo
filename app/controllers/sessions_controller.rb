class SessionsController < ApplicationController
  def create
    authenticate_user = AuthenticateUser.new(params[:email], params[:password])

    if authenticate_user.call
      redirect_to  new_two_factor_auth_path
    else
      flash.now[:error] = 'invalid email/password combo'
      render :new
    end
  end
end
