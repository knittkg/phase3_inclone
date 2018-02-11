class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(postpict_id: params[:postpict_id])
    redirect_to postpicts_url, notice: "#{favorite.postpict.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(postpict_id: params[:postpict_id]).destroy
    redirect_to postpicts_url, notice: "#{favorite.postpict.user.name}さんのブログをお気に入り解除しました"
  end
end
