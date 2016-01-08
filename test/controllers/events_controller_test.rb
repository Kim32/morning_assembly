require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @message = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, message: {allDay: @message.allDay, color: @message.color, end: @message.end, start: @message.start, title: @message.title }
    end

    assert_redirected_to event_path(assigns(:message))
  end

  test "should show event" do
    get :show, id: @message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @message, message: {allDay: @message.allDay, color: @message.color, end: @message.end, start: @message.start, title: @message.title }
    assert_redirected_to event_path(assigns(:message))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @message
    end

    assert_redirected_to events_path
  end
end
