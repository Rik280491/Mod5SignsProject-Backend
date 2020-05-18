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

    def create 
        user = get_user
        byebug
        video = user.videos.build(video_params)
        # byebug 
        video.save
        # error handling 
        render json: video
    end 


    private 
    
    def video_params 
        params.require(:video).permit(:video_url, :sign_id)
    end 
end
