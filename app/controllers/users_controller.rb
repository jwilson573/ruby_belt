class UsersController < ApplicationController
    before_action :require_login, except: [:create]
    before_action :auth, except: [:create]
    def create
        @user = User.new(user_params)
        p @user
        @user.save
        if @user.save
            
            flash[:notice] = ["Registered Successfully"]

            session[:user_id] = @user.id 
            
            return redirect_to '/ideas' 
            
        end
        
        errors = @user.errors.full_messages 

        flash[:errors] = errors

        return redirect_to :back

    end

    def edit
        @user = User.find(params[:id])
    end

    def show
        @user = User.find(params[:id])
    end

    def update
        # @user = User.find(params[:id])

        # if @location.valid?
        #     if @user.update(user_params) 
        #         flash[:notice] = ["User Created"]
        #         return redirect_to '/events'
        #     end
        # end
        # errors = @user.errors.full_messages + @location.errors.full_messages

        # flash[:errors] = errors

        # return redirect_to :back
    end   

    # Private Methods (Herp 'a derp)
    private
        def user_params
            params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
        end

        def auth
            return redirect_to user_path(current_user) unless current_user.id == params[:id].to_i
        end
end
