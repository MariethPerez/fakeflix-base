require 'rails_helper'

RSpec.describe Api::MoviesController, type: :controller do
    before do
        @movie1 = Movie.create(title: "The matrix", status: "preorder")
        @movie2 = Movie.create(title: "Movie2", status: "coming-soon")
    end
    
    describe 'GET index' do
        it 'returns http status ok' do
          get :index
          expect(response).to have_http_status(:ok)
        end
        it 'render json with all movies' do
          get :index
          movies = JSON.parse(response.body)
          expect(movies.size).to eq 2
        end
        it 'render json with all movies with filter status: "preorder" ' do
            get :index, params: { filter: "preorder" }
            movies = JSON.parse(response.body)
            expect(movies.size).to eq 1
        end
        it 'render json with all movies with filter status: "preorder" ' do
            get :index, params: { filter: "coming-soon" }
            movies = JSON.parse(response.body)
            expect(movies.size).to eq 1
        end
        it 'render json with all movies with filter status: "preorder" ' do
            get :index, params: { filter: "billboard" }
            movies = JSON.parse(response.body)
            expect(movies.size).to eq 0
        end
      end
      describe 'GET show' do
        it 'returns http status ok' do
          get :show, params:{id: @movie1}
          expect(response).to have_http_status(:ok)
        end
        it 'render the correct movie' do
          get :show, params: { id: @movie1 }
          expected_movie = JSON.parse(response.body)
          expect(expected_movie["id"]).to eq(@movie1.id)
        end
        it 'returns http status not found' do
          get :show, params: { id: 'xxx' }
          expect(response).to have_http_status(:not_found)
        end
      end
    end
