require 'test_helper'

class LikeDislikesControllerTest < ActionController::TestCase
  setup do
    @like_dislike = like_dislikes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:like_dislikes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create like_dislike" do
    assert_difference('LikeDislike.count') do
      post :create, like_dislike: { likes: @like_dislike.likes }
    end

    assert_redirected_to like_dislike_path(assigns(:like_dislike))
  end

  test "should show like_dislike" do
    get :show, id: @like_dislike
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @like_dislike
    assert_response :success
  end

  test "should update like_dislike" do
    patch :update, id: @like_dislike, like_dislike: { likes: @like_dislike.likes }
    assert_redirected_to like_dislike_path(assigns(:like_dislike))
  end

  test "should destroy like_dislike" do
    assert_difference('LikeDislike.count', -1) do
      delete :destroy, id: @like_dislike
    end

    assert_redirected_to like_dislikes_path
  end
end
