# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_user

  helper_method :current_user

  def current_user
    User.find session[:user_id]
  end

  private

  def set_user
    saved_user_id = session[:user_id]

    unless session[:user_id]
      session[:user_id]=User.first.id
    end
    session[:user_id]=params[:current_user_id] if params[:current_user_id]
    flash.now[:notice]='Добро пожаловать на пример gritter_notices! Вы вошли под ' + current_user.name unless saved_user_id==session[:user_id]
  end
end
