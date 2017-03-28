class SessionsController < ApplicationController
  def create
    begin
      @user = User.form_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "Welcom, #{@user.name}!"
    rescue => exception
      flash[:success] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
  end
end
