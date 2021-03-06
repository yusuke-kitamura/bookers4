
class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
      flash[:notice] = "You have created book successfully."
  	redirect_to book_path(@book)
    else
      @books = Book.all
      render action: :index
    end
  end

  def index
  	@books = Book.all
  	@book = Book.new
    @users = User.all
  end

  def show
  	@book = Book.find(params[:id])
    @booker = Book.new
  	@user = @book.user
  end

  def edit
  	@book = Book.find(params[:id])
    redirect_to books_path if current_user.id != @book.user_id
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
  else
    @books = Book.new
    render action: :edit
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
   end

  private
  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  end

end
