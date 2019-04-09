require 'rails_helper'

RSpec.describe Api::SeriesController, type: :controller do
    before do
        @serie1 = Serie.create(title: "Serie1", status: "preorder")
        @serie2 = Serie.create(title: "Serie2", status: "coming-soon")
    end
    
    describe 'GET index' do
        it 'returns http status ok' do
          get :index
          expect(response).to have_http_status(:ok)
        end
        it 'render json with all series' do
          get :index
          series = JSON.parse(response.body)
          expect(series.size).to eq 2
        end
        it 'render json with all movies with filter status: "preorder" ' do
            get :index, params: { filter: "preorder" }
            series = JSON.parse(response.body)
            expect(series.size).to eq 1
        end
        it 'render json with all movies with filter status: "coming-soon" ' do
            get :index, params: { filter: "coming-soon" }
            movies = JSON.parse(response.body)
            expect(movies.size).to eq 1
        end
        it 'render json with all movies with filter status: "billboard" ' do
            get :index, params: { filter: "billboard" }
            movies = JSON.parse(response.body)
            expect(movies.size).to eq 0
        end
      end
end
