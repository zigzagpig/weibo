require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @main_title = "小斗鱼"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "#{@main_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "帮助 #{@main_title}"
  end

  test "should get about" do
  	get :about
  	assert_response :success
    assert_select "title", "关于 #{@main_title}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "联系 #{@main_title}"
  end

  test "should get test" do
    get :test
    assert_response :success
    assert_select "title", "我爱吃饭"
  end
end
