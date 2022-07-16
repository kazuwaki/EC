class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  def genre_search
    @genres = Genre.all
    items = Item.genre_search(params[:genre_id])
    @items = items.all
    @genre_name = Genre.find(params[:genre_id]).name
  end

end
