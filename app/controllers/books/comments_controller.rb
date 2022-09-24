# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  before_action :set_book, only: :create

  def create
    @comments = @book.comments
    @new_comment = @comments.build(comment_params)
    @new_comment.commenter = current_user

    flash[:alert] = @new_comment.errors.full_messages.to_sentence unless @new_comment.save
    redirect_to @book
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
