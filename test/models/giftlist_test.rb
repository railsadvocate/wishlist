require 'test_helper'

class GiftlistTest < ActiveSupport::TestCase
  test 'wishlist must have a type' do
    @giftlist = Giftlist.new
    assert_not @giftlist.save, 'wishlist was saved without a type'
  end

  test 'wishlist should be unfulfiled on creating' do
    @giftlist = Giftlist.new
    @giftlist.gift_type = 'birthday'
    @giftlist.save
    assert_equal(false, @giftlist.fulfilled, 'wishlist should be unfulfilled by default')
  end

  test 'wishlist must have an associated user' do
    @giftlist = Giftlist.new
    @giftlist.gift_type = 'birthday'
    assert_not @giftlist.save, 'wishlist was saved without user'
  end

  test 'wishlist has no associated gifts' do
    @giftlist = giftlists(:valid_giftlist)
    assert @giftlist.save, 'wishlist was not saved with no corresponding gifts '
  end

  test 'wishlist has only one associated gift' do
    @giftlist = giftlists(:valid_giftlist)
    @giftlist.gifts = [gifts(:book)]
    assert @giftlist.save, 'wishlist was not saved with one corresponding gift'
  end

  test 'wishlist has more than one associated gift' do
    @giftlist = giftlists(:valid_giftlist)
    @giftlist.gifts = gifts(:video_game, :book, :cookware)
    assert @giftlist.save, 'wishlist was not saved with multiple corresponding gifts'
  end
end
