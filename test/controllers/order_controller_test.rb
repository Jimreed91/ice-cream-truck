require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get order_create_url
    assert_response :success
  end

  test 'should get update' do
    get order_update_url
    assert_response :success
  end

  test 'should get delete' do
    get order_delete_url
    assert_response :success
  end
end
