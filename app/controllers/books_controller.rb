class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
