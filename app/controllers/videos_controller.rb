class VideosController < ApplicationController


    def index 
        videos = Video.all
        # sort alphabetically
        render json: videos, include: [:user, :sign]
    end 

    def show 
        video = Video.find(params[:id])
        render json: video, include: [:user, :sign]
    end 



    private 
    
    def video_params 
        params.require(:video).permit(:video_url, :sign_id)
    end 
end
