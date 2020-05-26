class SignsController < ApplicationController

    def index 
        signs = Sign.all.sort{ |a, b| a.name <=> b.name }
        render json: signs, include: [:videos, :users]
    end 

    def show 
        sign = Sign.find(params[:id])
        render json: sign, include: [:videos, :users]
    end 
    
      def create 
        
        if params[:sign_name] != ""
        sign = Sign.find_or_create_by(name: params[:sign_name])
          
          video = get_user.videos.build(sign_id: sign.id, video_url: params[:video_url])
          video.save
          
          # render json: sign, include: [:videos, :users]
          render json: {sign: sign.serialise_details, message: "Your video has been uploaded. Thank you for your contribution!"}
          
      
        else 
          render json: { error: "Sign must have a name" }
        end
        
      end
    
  
    


end
