require 'test_helper'

class TimesheetsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timesheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timesheet" do
    assert_difference('Timesheet.count') do
      post :create, :timesheet => { }
    end

    assert_redirected_to timesheet_path(assigns(:timesheet))
  end

  test "should show timesheet" do
    get :show, :id => timesheets(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => timesheets(:one).id
    assert_response :success
  end

  test "should update timesheet" do
    put :update, :id => timesheets(:one).id, :timesheet => { }
    assert_redirected_to timesheet_path(assigns(:timesheet))
  end

  test "should destroy timesheet" do
    assert_difference('Timesheet.count', -1) do
      delete :destroy, :id => timesheets(:one).id
    end

    assert_redirected_to timesheets_path
  end
end
