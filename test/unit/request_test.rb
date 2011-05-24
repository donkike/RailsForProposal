require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Request.new.valid?
  end
end
