require 'test_helper'

class AcronymsControllerTest < ActionController::TestCase
  setup do
    @acronym = acronyms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acronyms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acronym" do
    assert_difference('Acronym.count') do
      post :create, acronym: @acronym.attributes
    end

    assert_redirected_to acronym_path(assigns(:acronym))
  end

  test "should show acronym" do
    get :show, id: @acronym.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acronym.to_param
    assert_response :success
  end

  test "should update acronym" do
    put :update, id: @acronym.to_param, acronym: @acronym.attributes
    assert_redirected_to acronym_path(assigns(:acronym))
  end

  test "should destroy acronym" do
    assert_difference('Acronym.count', -1) do
      delete :destroy, id: @acronym.to_param
    end

    assert_redirected_to acronyms_path
  end
end
