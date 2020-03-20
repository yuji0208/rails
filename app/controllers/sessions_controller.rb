class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email:email_params[:email]) #フォームから送信されたメールアドレスを取得し、一致するユーザーを検索
    if user && user.authenticate(password_params[:password]) #ユーザーのパスワードが正しいか確かめる
      log_in user #true
      redirect_to root_path, success: 'ログインに成功しました'
    else #false
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: "ログアウトしました"
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id) #セッションに保存されているuser_idを削除することでログアウトの実行
    @current_user = nil #ユーザー情報を削除
  end
  def email_params
    params.require(:session).permit(:email)
  end
  
  def password_params
    params.require(:session).permit(:password)
  end
 
end

