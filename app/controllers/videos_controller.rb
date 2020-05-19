class VideosController < ApplicationController


    def index 
        videos = Video.all

        # videos = get_user.videos
        # sort alphabetically
        render json: videos, include: [:sign, :user]
    end 

    def show 
        video = Video.find(params[:id])
        render json: video, include: [:user, :sign]
    end 

    def destroy
        video = Video.find(params[:id])
        video.destroy
        render json: video
    end 


    private 
    
    def video_params 
        params.require(:video).permit(:video_url, :sign_id)
    end 
end
