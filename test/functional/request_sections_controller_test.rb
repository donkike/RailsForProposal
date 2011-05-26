require 'test_helper'

class RequestSectionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => RequestSection.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    RequestSection.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    RequestSection.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to request_section_url(assigns(:request_section))
  end

  def test_edit
    get :edit, :id => RequestSection.first
    assert_template 'edit'
  end

  def test_update_invalid
    RequestSection.any_instance.stubs(:valid?).returns(false)
    put :update, :id => RequestSection.first
    assert_template 'edit'
  end

  def test_update_valid
    RequestSection.any_instance.stubs(:valid?).returns(true)
    put :update, :id => RequestSection.first
    assert_redirected_to request_section_url(assigns(:request_section))
  end

  def test_destroy
    request_section = RequestSection.first
    delete :destroy, :id => request_section
    assert_redirected_to request_sections_url
    assert !RequestSection.exists?(request_section.id)
  end
end
