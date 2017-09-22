class CommentsController < ApplicationController
  def create
    # Instをパラメータの値から探し出し,Instに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @inst = @comment.inst
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to inst_path(@inst), notice: 'コメントを投稿しました。' }
      else
        format.html { render :new }
      end
    end
  end
  
  def destroy
    set_comment
    @inst = @comment.inst
    respond_to do |format|
      @comment.destroy
        format.html { redirect_to inst_path(@inst) }
          flash.now[:notice] = "コメントが削除されました!"
        format.js { render :index }
    end
  end
  
  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:inst_id, :content)
    end
    
    def set_comment
       @comment = Comment.find(params[:id])
    end
end