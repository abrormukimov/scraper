require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'GET /root' do
    before do
      FactoryBot.create_list(:article, 10)
      get '/'
    end

    it 'returns all articles' do
      expect(json.size).to eq(10)
    end

    it 'returns a 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    context 'with invalid parameters' do
      before do
        post '/api/v1/articles', params:
                          { article: {
                            headline: ''
                          } }
      end

      it 'returns an unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end