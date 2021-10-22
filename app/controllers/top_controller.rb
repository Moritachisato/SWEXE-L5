class TopController < ApplicationController
  def main
    render 'login'
  end

  def login
    user = User.find_by(uid: params[:uid])
    if user and BCrypt::Password.new(user.pass) == params[:pass]
      #TODO: ログイン成功したことをユーザに知らせる
      flash[:noteice] = 'ログインしました'
      session[:login_uid] = user.uid
      redirect_to root_path
    else
      #TODO: エラーメッセージ
      flash[:noteice] = 'ログインに失敗しました'
      render 'login'
    end
  end

  def logout
    #TODO: ログアウトに成功したことをユーザに知らせる
    flash[:noteice] = 'ログアウトしました'
    session.delete(:login_uid)
    redirect_to root_path
  end
end
