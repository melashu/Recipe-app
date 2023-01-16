require 'test_helper'

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get ingredients_new_url
    assert_response :success
  end
end
