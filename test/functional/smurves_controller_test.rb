require 'test_helper'

class SmurvesControllerTest < ActionController::TestCase
  setup do
    @smurf = smurves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smurves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smurf" do
    assert_difference('Smurf.count') do
      post :create, smurf: {  }
    end

    assert_redirected_to smurf_path(assigns(:smurf))
  end

  test "should show smurf" do
    get :show, id: @smurf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smurf
    assert_response :success
  end

  test "should update smurf" do
    put :update, id: @smurf, smurf: {  }
    assert_redirected_to smurf_path(assigns(:smurf))
  end

  test "should destroy smurf" do
    assert_difference('Smurf.count', -1) do
      delete :destroy, id: @smurf
    end

    assert_redirected_to smurves_path
  end
end
