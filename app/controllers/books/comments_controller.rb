# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_book, only: %i[create destroy]

  def create
    super(@book)
  end

  def destroy
    super(@book, params[:id])

    redirect_to @book
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
