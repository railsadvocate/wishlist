class GiftsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @gift = Gift.new
    @giftlist = Giftlist.find(params[:giftlist_id])
  end

  def edit
  end
end
