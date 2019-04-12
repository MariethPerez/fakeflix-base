class Api::MoviesController < ApplicationController
            
    def index
        @movies = Movie.all
        if  params[:filter]
            @movies = Movie.where(status: params[:filter])
        end
        # render json: Movie.includes(:rentals).all.as_json(methods: [:rented]) , status: :ok
        render json: @movies.as_json(methods: [:rented]) , status: :ok
    end

    def show
        render json: Movie.find(params[:id]).as_json(methods: [:rented])  , status: :ok
    end


    def playback
        movie=Movie.find(params[:id])
        movie.update(progress: params[:progress])
        render json: movie

      end

    rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { message: e.message }, status: :not_found
      end
end

