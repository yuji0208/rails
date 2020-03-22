class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params_comment)
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
  
    if @comment.save
      redirect_to topics_path, success: "コメントを投稿しました"#成功
    else#失敗
      flash.now[:danger] = "コメントの投稿に失敗しました"
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :topic_id)
  end
end