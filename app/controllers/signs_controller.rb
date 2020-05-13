class SignsController < ApplicationController

    def index 
        signs = Sign.all 
        render json: signs
    end 

    
    
      def create 
        sign = Sign.new(sign_params)
    
        if sign
          sign.save
          render json: sign 
        else 
          render json: {error: "Sign not valid "}
        end
      end
    
      private 
    
      def sign_params 
        # doesn't need user_id, user token 
        params.require(:sign).permit(:name, :video_url)
      end

    


end
