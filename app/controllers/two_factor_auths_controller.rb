class TwoFactorAuthsController < ApplicationController
  def create
    if params[:code] == '1234'
      redirect_to accounts_path
    else
      flash.now['error'] = "incorrect code"
      render :new
    end

  end
end
