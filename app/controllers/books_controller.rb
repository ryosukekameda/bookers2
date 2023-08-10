class BooksController < ApplicationController
  before_action :current_user, only: [:edit, :update]
  
  def new
    @book = Book.new
  end
  
  def create
    @books = Book.new(book_params)
    @books.user_id = current_user.id
    @books.save
    redirect_to books_path(@books.id)
  end
  
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
  
  def show
    @book = Book.find(params[:id])
    @user = current_user
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
    
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end  
    
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
