class SignsController < ApplicationController

    def index 
        signs = Sign.all 
        render json: signs, include: [:videos]
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
        params.require(:sign).permit(:name, :video)
      end

    


end
