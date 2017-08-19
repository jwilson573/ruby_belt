class LikesController < ApplicationController
    def create
        
        idea = Idea.find(params[:like_id])
        Like.create(idea: idea, user: current_user)

        return redirect_to ideas_path
    end

    def destroy
        idea = Idea.find(params[:id])
        Like.find_by(idea: idea, user: current_user).delete

        return redirect_to ideas_path
    end
end
