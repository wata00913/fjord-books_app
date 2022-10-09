# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  before_action :set_book, only: %i[create destroy]

  def create
    @comments = @book.comments
    @new_comment = @comments.build(comment_params)
    @new_comment.user = current_user

    flash[:alert] = @new_comment.errors.full_messages.to_sentence unless @new_comment.save

    redirect_to @book
  end

  def destroy
    comment_id = params[:id]
    @book.comments.find(comment_id).destroy
    # 削除されたコメントはcommentsオブジェクトに残ったままなので同期化する
    @book.comments.reload

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
