require 'test_helper'

class SectionItemsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => SectionItem.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    SectionItem.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    SectionItem.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to section_item_url(assigns(:section_item))
  end

  def test_edit
    get :edit, :id => SectionItem.first
    assert_template 'edit'
  end

  def test_update_invalid
    SectionItem.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SectionItem.first
    assert_template 'edit'
  end

  def test_update_valid
    SectionItem.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SectionItem.first
    assert_redirected_to section_item_url(assigns(:section_item))
  end

  def test_destroy
    section_item = SectionItem.first
    delete :destroy, :id => section_item
    assert_redirected_to section_items_url
    assert !SectionItem.exists?(section_item.id)
  end
end
