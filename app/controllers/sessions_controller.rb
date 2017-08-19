class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]
    def destroy
        session.clear

        return redirect_to root_path
    end

    def create
        @user = User.find_by_email(params[:email])
        if @user
            if @user.try(:authenticate, params[:password])
                session[:user_id] = @user.id 
                return redirect_to ideas_path

            end

            flash[:errors] = ["Password is invalid"]
            
        elsif !@user && !@user.try(:authenticate, params[:password])

            flash[:errors] = ["Email is invalid"] + ["Password is invalid"]

        else
            flash[:errors] = ["Email is invalid"]
        end

        return redirect_to :back
    end

end
