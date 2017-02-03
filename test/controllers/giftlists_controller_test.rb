require 'test_helper'

class GiftlistsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:mark)
  end

  test 'should be redirected to root path giftlists#new view' do
    get new_giftlist_path
    assert_response :success, 'got invalid response from giftlists#new'
  end


end
