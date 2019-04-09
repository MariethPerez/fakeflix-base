class Api::MoviesController < ApplicationController
            
    def index
        if  params[:filter]
            render json: Movie.where(status: params[:filter])
        else       
            render json: Movie.all
        end
    end
end

