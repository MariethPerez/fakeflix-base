class Api::SeriesController < ApplicationController
    def index
        if  params[:filter]
            render json: Serie.where(status: params[:filter])
        else       
            render json: Serie.all
        end
    end

end
