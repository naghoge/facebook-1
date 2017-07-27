class PicturesController < ApplicationController
    def index
      @pictures = Inst.all
    end
    
    def destroy
      @picture = Inst.find(params[:id])
      @picture.image=nil
      if @picture.save
       redirect_to pictures_path, notice: "画像を削除しました"
      else
       redirect_to pictures_path, notice: "画像が削除できませんでした"          
      end
    end
    
    def edit
      @picture = Inst.find(params[:id])
    end
    
    def update
      @picture = Inst.find(params[:id])
      @picture.update(pictures_params)
      goindex
    end
    
    private
        def goindex
            redirect_to pictures_path
        end
        
        def pictures_params
            params.require(:picture).permit(:image)
        end
end
