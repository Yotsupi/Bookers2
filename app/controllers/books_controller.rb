class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
