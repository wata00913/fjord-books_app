# frozen_string_literal: true

class CommentsController < ApplicationController
  def create(commentable)
    @comments = commentable.comments
    @new_comment = @comments.build(comment_params)
    @new_comment.commenter = current_user

    flash[:alert] = @new_comment.errors.full_messages.to_sentence unless @new_comment.save
    redirect_to commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
