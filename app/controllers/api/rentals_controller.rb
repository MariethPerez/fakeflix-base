class Api::RentalsController < ApplicationController

    def index
        movies = Rental.list_only("Movie")
        series = Rental.list_only("Serie")
        render json: {"Movies" => movies, "Series" => series}, status: :ok
    end
end
