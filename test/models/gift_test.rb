require 'test_helper'

class GiftTest < ActiveSupport::TestCase
  test 'gift should not be saved without name' do
    @gift = gifts(:no_name)
    assert_not @gift.save, 'gift was saved without name'
  end

  test 'gift should not be saved without link' do
    @gift = gifts(:no_link)
    assert_not @gift.save, 'gift was saved without a link'
  end

  test 'gift should not be saved without estimated_price' do
    @gift = gifts(:no_estimated_price)
    assert_not @gift.save, 'gift was saved without estimated price'
  end

  test 'gift name should be longer than 1 character' do
    @gift = gifts(:gift_name_too_short)
    assert_not @gift.save, 'gift was saved with gift name too short'
  end

  test 'gift name should be shorter than 75 characters' do
    @gift = gifts(:gift_name_too_long)
    @gift.name = ''
    76.times do @gift.name << 'a' end
    assert_not @gift.save, 'gift was saved with gift name too long'
  end

  test 'gift should not be saved with a non-numeric price' do
    @gift = gifts(:gift_without_numeric_price)
    @gift.estimated_price = 'object'
    assert_not @gift.save, 'gift was saved with non-numeric name'
  end

  test 'gift should allow a blank description' do
    @gift = gifts(:no_description)
    assert @gift.save, 'gift was not saved when description was blank'
  end

  test 'description should be shorter than 201 characters' do
    @gift = gifts(:no_description)
    @gift.description = ''
    201.times do
      @gift.description << 'a'
    end
    assert_not @gift.save, 'gift was saved with a description length too long'
  end

  test 'description should be longer than 9 characters' do
    @gift = gifts(:no_description)
    @gift.description = ''
    9.times do
      @gift.description << 'a'
    end
    assert_not @gift.save, 'gift was saved with a description too short'
  end

  test 'gift must have a valid link -- i.e. link format --' do
    # NOTE: this app uses the validate_url gem to perform model layer validations
    # against the 'link'. The gem checks many formats but isn't perfect. This is okay.
    @gift = gifts(:no_link)
    @gift.link = 'hi there'
    assert_not @gift.save, 'gift was saved with invalid link(url) format'
    @gift.link = 'https:/www.google.com'
    assert_not @gift.save, 'gift was saved with invalid link(url) format'
    @gift.link = 'http//google'
    assert_not @gift.save, 'gift was saved with invalid link(url) format'
  end
end
