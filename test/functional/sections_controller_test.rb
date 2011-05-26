require 'test_helper'

class SectionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Section.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Section.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Section.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to section_url(assigns(:section))
  end

  def test_edit
    get :edit, :id => Section.first
    assert_template 'edit'
  end

  def test_update_invalid
    Section.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Section.first
    assert_template 'edit'
  end

  def test_update_valid
    Section.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Section.first
    assert_redirected_to section_url(assigns(:section))
  end

  def test_destroy
    section = Section.first
    delete :destroy, :id => section
    assert_redirected_to sections_url
    assert !Section.exists?(section.id)
  end
end
