require 'test_helper'

class TestMessage < Test::Unit::TestCase
  include Basil

  def test_message
    msg = Message.new('To', 'From', 'From Name', 'Some text')

    assert_equal 'To',        msg.to
    assert_equal 'From',      msg.from
    assert_equal 'From Name', msg.from_name
    assert_equal 'Some text', msg.text

    assert !msg.to_me?, "Message should not be to 'me'"
  end

  def test_message_to_me
    msg = Message.new(Config.me, nil, nil, '')
    assert msg.to_me?, "Message should be to 'me'"
  end
end