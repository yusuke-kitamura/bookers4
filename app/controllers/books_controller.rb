class BooksController < ApplicationController
  def index
  end

  def show
  	@book = Book.find(params[:id])
  	@books = Book.all
  	@book = Book.new
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	@book.save
  	redirect_to book_path(@book)
  end

  private
  def book_params
  	params.require(:book).permit(:title, :opinion)
  end

end
