# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  before_action :set_book, only: %i[create destroy]

  def create
    comment = @book.comments.build(comment_params)
    comment.user = current_user

    flash[:alert] = comment.errors.full_messages.to_sentence unless comment.save

    redirect_to @book
  end

  def destroy
    comment = current_user.comments.where(commentable: @book).find(params[:id])
    comment.destroy

    flash[:notice] = t('controllers.common.notice_destroy', name: Comment.model_name.human)

    redirect_to @book
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
