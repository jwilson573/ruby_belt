class IdeasController < ApplicationController
    def index
        @user = User.find(current_user)
        @ideas = Idea.all
    end

    def create
        @idea = Idea.new(content: params[:content], user: current_user)      
        @idea.save
        if @idea.valid?
            @idea.save
            flash[:notice] = ["Successfully Created Idea"]

            return redirect_to ideas_path
        end

        errors = @idea.errors.full_messages

        flash[:errors] = errors

        return redirect_to :back

    end

    def show
        @idea = Idea.find(params[:id])
        
    end

    def destroy
        @idea = Idea.find(params[:id])
        likes = Like.where(idea: @idea)
        @idea.delete
        return redirect_to '/ideas'
    end
end
