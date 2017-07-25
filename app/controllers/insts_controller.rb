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
    @inst.save
    NoticeMailer.sendmail_inst(@inst).deliver
    goindex
  end
  
  def destroy
    @inst = Inst.find(params[:id])
    @inst.destroy
    goindex
  end
  
  def edit
    @inst = Inst.find(params[:id])
  end
  
  def update
    @inst = Inst.find(params[:id])
    @inst.update(insts_params)
    goindex
  end
  
   private
    def insts_params
      params.require(:inst).permit(:title, :content)
    end
    
    def goindex
      redirect_to insts_path
    end
  
end
