class SessionsController < ApplicationController

  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to root_path, notice: t('flash.sessions.notice.logged_in')
    else
      redirect_to signin_path, alert: t('flash.sessions.alert.error_login')
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: t('flash.sessions.notice.logged_out')
  end

end
