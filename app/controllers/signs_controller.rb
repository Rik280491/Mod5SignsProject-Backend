class SignsController < ApplicationController

    def index 
        signs = Sign.all 
        render json: signs, include: [:videos, :users]
    end 

    
    
      def create 
        
        # error handling 
        if params[:sign_name] != ""
        sign = Sign.find_or_create_by(name: params[:sign_name])
          
          video = get_user.videos.build(sign_id: sign.id, video_url: params[:video_url])
          video.save
          
          # render json: sign, include: [:videos]
          render json: { message: "Your video has been uploaded. Thank you for your contribution!"}
        else 
          render json: { error: "Sign must have a name" }
        end
      end
    
    
      # private 
    
      # def sign_params 
      #   params.require(:sign).permit(:name)
      # end

    


end
