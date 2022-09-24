# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_book, only: :create

  def create
    super(@book)
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
