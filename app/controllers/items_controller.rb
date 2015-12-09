class ItemsController < ApplicationController
  before_action :set_list, :set_item

  def create
    @item = @list.items.create(item_params)
    redirect_to user_list_path(@list.user, @list)
  end

  def show
  end

  def edit
  end
  
  def destroy
    description = @item.description
    @item.destroy
    redirect_to user_list_path(@list.user, @list), notice: "Woo! High five - you completed #{description}! Reward yourself with a cookie."
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:list_id])
  end

  def set_item
    @item = Item.find(params[:id]) if params[:id]
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:description)
  end
end
