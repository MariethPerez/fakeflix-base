class Api::SeriesController < ApplicationController
    def index

        @series=Serie.all
        if  params[:filter]
            @series= Serie.where(status: params[:filter]) 
        end
         render json: @series.as_json(methods: [:rented]) , status: :ok
    end

    def show
        render json: Serie.find(params[:id]).as_json(methods: [:rented], include: {episodes:  {only: [:id,:title]}} ) , status: :ok
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { message: e.message }, status: :not_found
      end


end
