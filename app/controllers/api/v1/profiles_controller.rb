class Api::V1::ProfilesController < ApplicationController
    before_action :authenticate_user! 
    before_action :set_profile, only: [:show, :update, :destroy]

    # this is a singleton resource, meaning that current_user will only ever have one profile, so there is no index method, no id is passed in the url, and the url is singular

    def show
        render json: @profile
    end
    
    def create
        unless current_user.profile != nil
            profile = current_user.create_profile(profile_params) # there is no current_user.profile before profile exists for has_one relatiionships
            if profile.save
                render json: profile
            else
                render json: profile.errors
            end
        else
            render json: { message: "Users cannot have more than one profile" }
        end
    end
    
    def update
        @profile.update(profile_params)
        if @profile.save
            render json: @profile
        else
            render json: @profile.errors
        end
    end
    
    def destroy
        @profile.destroy
        render json: { message: "Profile deleted!" }    
    end

    private 

    def set_profile
        @profile = current_user.profile
    end

    def profile_params
        params.require(:profile).permit(:background_color)
    end
    
end
