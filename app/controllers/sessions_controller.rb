class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: paramsl[:session][:email])
    if user && user.authenticate(pamams[:session][:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    eles
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end
end