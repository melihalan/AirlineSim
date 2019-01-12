class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
  end

  private

  def book_params
    params.permit(:user_id, :balance)
  end

end
