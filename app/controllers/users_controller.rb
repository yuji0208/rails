class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params) #params=送られてきた値を受け取るメソッド
    if @user.save
      redirect_to root_path , success: "登録が完了しました"
      #redirect_toは指定したpath(URL)に転送
    else #@user.saveが失敗した場合
      flash.now[:danger] = "登録に失敗しました" #.nowをつけた場合、移動した次のページのみメッセージが表示されるようになり、その次のページでは表示されない仕組みになります。
      render :new #データを取得して表示する場合
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
