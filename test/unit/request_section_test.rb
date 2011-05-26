require 'test_helper'

class RequestSectionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert RequestSection.new.valid?
  end
end
