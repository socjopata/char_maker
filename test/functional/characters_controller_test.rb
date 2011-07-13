require 'test_helper'

class CharactersControllerTest < ActionController::TestCase
  setup do
    @character = characters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:characters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character" do
    assert_difference('Character.count') do
      post :create, :character => @character.attributes
    end

    assert_redirected_to character_path(assigns(:character))
  end

  test "should show character" do
    get :show, :id => @character.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @character.to_param
    assert_response :success
  end

  test "should update character" do
    put :update, :id => @character.to_param, :character => @character.attributes
    assert_redirected_to character_path(assigns(:character))
  end

  test "should destroy character" do
    assert_difference('Character.count', -1) do
      delete :destroy, :id => @character.to_param
    end

    assert_redirected_to characters_path
  end
end
