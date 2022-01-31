class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comment.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:body)
  end

end