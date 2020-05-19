class SignsController < ApplicationController

    def index 
        signs = Sign.all 
        render json: signs, include: [:videos, :users]
    end 

    
    
      def create 
        
        # error handling 
        sign = Sign.find_or_create_by(name: params[:sign_name])
          
          video = get_user.videos.build(sign_id: sign.id, video_url: params[:video_url])
          video.save
          
          render json: sign, include: [:videos]
       
      end
    
    
      # private 
    
      # def sign_params 
      #   params.require(:sign).permit(:name)
      # end

    


end
