class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  	@users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  @user = User.find(params[:id])
  redirect_to user_path(current_user) unless current_user == @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  else
    render action: :edit
  end
  end

  private

   def user_params
   	   params.require(:user).permit(:name, :introduction, :image)
   end
end
