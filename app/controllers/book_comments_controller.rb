class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.book_id = book.id
    comment.user_id = current_user.id
    comment.save
    # binding.pry
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    book_comment = book.book_comments.find(params[:id])
    book_comment.destroy
    redirect_back(fallback_location: root_path)
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:body)
  end

end