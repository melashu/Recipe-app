require 'rails_helper'

RSpec.describe 'foods', type: :request do
  describe 'GET/index' do
    before :each do
      get '/foods/index'
    end
    it 'is a success' do
      expect(response).to have_http_status(302)
    end
    it 'Should return the correct placeholder' do
      expect(response.body).to include('You are being')
    end
  end
end
