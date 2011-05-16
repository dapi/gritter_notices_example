# -*- coding: utf-8 -*-
class WelcomeController < ApplicationController
  def index
  end

  def notice
    user = User.find params[:user_id]
    message = params[:message].blank? ? 'Пустое сообщение' : params[:message]
    message += ' от '+user.name
    user.notice message, :level=>params[:level].to_sym, :sticky=>params[:sticky]
    flash.now[:warning]='Отправлено сообщение для ' + user.name
    render :index
  end
end
