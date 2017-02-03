class GiftlistsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def show
  end

  def edit
  end

  def new
    @giftlist = Giftlist.new
  end

  def create
    @giftlist = Giftlist.new(get_giftlist_params)
    @giftlist.user = current_user
    if @giftlist.save
      redirect_to new_giftlist_gift_path(@giftlist), notice: 'Giftlist was successfully created!'
    else
      redirect_to new_giftlist_path, alert: 'There were errors saving your Giftlist title'
    end
  end

  def update
  end

  def destroy
  end

  private
  def get_giftlist_params
    params.require(:giftlist).permit(:gift_type)
  end

end
