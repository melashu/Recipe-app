require 'test_helper'

class GeneralShopingListsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get general_shoping_lists_index_url
    assert_response :success
  end
end
