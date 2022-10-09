# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :set_report, only: %i[create destroy]

  def create
    @comments = @report.comments
    @new_comment = @comments.build(comment_params)
    @new_comment.commenter = current_user

    flash[:alert] = @new_comment.errors.full_messages.to_sentence unless @new_comment.save

    redirect_to @report
  end

  def destroy
    comment_id = params[:id]
    @report.comments.find(comment_id).destroy
    # 削除されたコメントはcommentsオブジェクトに残ったままなので同期化する
    @report.comments.reload

    flash[:notice] = t('controllers.common.notice_destroy', name: Comment.model_name.human)

    redirect_to @report
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_report
    @report = Report.find(params[:report_id])
  end
end
