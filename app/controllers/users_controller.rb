class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to  user_path(current_user.id)
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
