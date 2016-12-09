class ApplicationController < ActionController::Base
  before_action :set_locale

  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def default_url_options(options={})
    { locale: I18n.locale }.merge options
  end

  private
  def set_locale

    I18n.locale = params[:locale] || preferred_locale || I18n.default_locale
  end

  def preferred_locale
    locale = extract_locale_from_accept_language_header
    return locale if I18n.available_locales.map(&:to_s).include?(locale)
    nil
  end

  def extract_locale_from_accept_language_header
    accept_language = request.env['HTTP_ACCEPT_LANGUAGE']
    return nil unless accept_language.present?
    accept_language.scan(/^[a-z]{2}/).first
  end

  def user_not_authorized
    flash[:alert] = t('flash.application.alert.not_authorized')
    redirect_to root_path
  end
end
