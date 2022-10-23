# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :set_report, only: %i[create destroy]

  def create
    comment = @report.comments.build(comment_params)
    comment.user = current_user

    flash[:alert] = comment.errors.full_messages.to_sentence unless comment.save

    redirect_to @report
  end

  def destroy
    unless operable?
      flash[:alert] = t 'controllers.common.alert_destroy', name: Comment.model_name.human
      return redirect_to @report
    end

    @report.comments.find(params[:id]).destroy

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

  def operable?
    comment = @report.comments.find(params[:id])
    comment.user == current_user
  end
end
