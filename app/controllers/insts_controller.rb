class InstsController < ApplicationController
  before_action :authenticate_user!
  def index
    @insts = Inst.all
  end
  
  def new
    @inst = Inst.new
  end
  
  def create
    @inst = Inst.new(insts_params)
    @inst.user_id = current_user.id
    if @inst.save
      NoticeMailer.sendmail_inst(@inst).deliver
      redirect_to insts_path, notice: "新インスタを投稿しました！"
    else
      redirect_to new_inst_path, notice: "タイトルを入力してください"
    end
  end
  
  def destroy
    @inst = Inst.find(params[:id])
    @inst.destroy
    redirect_to insts_path
  end
  
  def edit
    @inst = Inst.find(params[:id])
  end
  
  def update
    @inst = Inst.find(params[:id])
    @inst.update(insts_params)
    redirect_to insts_path
  end
  
   private
    def insts_params
      params.require(:inst).permit(:title, :content, :image)
    end
end
