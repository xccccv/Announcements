# frozen_string_literal: true

require 'test_helper'

class Demo2ControllerTest < ActionDispatch::IntegrationTest
  test 'should get index2' do
    get demo2_index2_url
    assert_response :success
  end
end
