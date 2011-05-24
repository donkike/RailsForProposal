require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Request.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Request.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Request.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to request_url(assigns(:request))
  end

  def test_edit
    get :edit, :id => Request.first
    assert_template 'edit'
  end

  def test_update_invalid
    Request.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Request.first
    assert_template 'edit'
  end

  def test_update_valid
    Request.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Request.first
    assert_redirected_to request_url(assigns(:request))
  end

  def test_destroy
    request = Request.first
    delete :destroy, :id => request
    assert_redirected_to requests_url
    assert !Request.exists?(request.id)
  end
end
