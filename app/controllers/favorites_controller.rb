class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
    # JS形式で返す
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy if favorite.present?  # ← nilチェックを追加

    respond_to do |format|
      format.js
    end
  end
end
