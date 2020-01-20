class Api::V1::ProfilesController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :set_profile, only: [:show, :update, :destroy]
    def index
    end
    def show
        require 'pry';binding.pry

    end

    def create
    end

    def update

    end

    def delete

    end

    private 

    def set_profile
        @profile = current_user.profile
    end
end
