require 'test_helper'

class SectionItemTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SectionItem.new.valid?
  end
end
