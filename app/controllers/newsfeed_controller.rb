class NewsfeedController < ApplicationController
  def index
    @feed_items = Item.all.order('created_at DESC')
  end
end
