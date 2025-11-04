class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
      redirect_to book_path(book)
    else
      @new_book = Book.new
      @book = book
      @book_comment = comment
      @book_comments = book.book_comments
      flash.now[:alert] = "コメントを入力してください。"
      render 'books/show'
    end

  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
