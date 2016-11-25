class SessionsController < ApplicationController

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to root_path, notice: 'Logged in!'
    else
      redirect_to signin_path, alert: 'Email or password was invalid'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end

end
