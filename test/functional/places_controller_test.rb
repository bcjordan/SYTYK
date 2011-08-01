require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Place.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Place.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Place.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to place_url(assigns(:place))
  end

  def test_edit
    get :edit, :id => Place.first
    assert_template 'edit'
  end

  def test_update_invalid
    Place.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Place.first
    assert_template 'edit'
  end

  def test_update_valid
    Place.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Place.first
    assert_redirected_to place_url(assigns(:place))
  end

  def test_destroy
    place = Place.first
    delete :destroy, :id => place
    assert_redirected_to places_url
    assert !Place.exists?(place.id)
  end
end
