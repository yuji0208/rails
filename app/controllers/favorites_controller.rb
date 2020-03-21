class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end
  
  def create
    favorite = Favorite.new #Favoriteクラスのインスタンスfavoriteを生成する
    favorite.user_id = current_user.id #favorite.user_idに現在ログインしているuser(current_user)のidを保存する
    favorite.topic_id = params[:topic_id] #favorite.topic_idにparams[:topic_id]を保存する
    
    if favorite.save #成功
      redirect_to topics_path, success: "お気に入り登録しました"
    else #失敗
      redirect_to topics_path, danger: "お気に入りの登録に失敗しました"
    end
  end
  
  def destroy
    Favorite.find_by(params[:topic_id]).destroy #取得したtopic_idを含むカラムを削除する処理
    flash[:success] = "お気に入りを取り消しました"
    redirect_to topics_path
  end
end
