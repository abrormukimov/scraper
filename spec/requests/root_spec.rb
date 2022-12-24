require 'rails_helper'

RSpec.describe 'Homes' do
  describe 'GET /root' do
    before { get '/' }

    it 'returns a 200' do
      expect(response).to have_http_status(:ok)
    end
  end
end