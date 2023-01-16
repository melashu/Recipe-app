require 'rails_helper'

RSpec.describe 'recipes', type: :request do
  describe 'GET/index' do
    before :each do
      get '/recipes/'
    end
    it 'is a success' do
      expect(response).to have_http_status(302)
    end
  end
end
