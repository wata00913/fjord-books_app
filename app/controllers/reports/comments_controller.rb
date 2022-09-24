# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :set_report, only: :create

  def create
    @comments = @report.comments
    @new_comment = @comments.build(comment_params)
    @new_comment.commenter = current_user

    if @new_comment.save
      redirect_to @report
    else
      render 'reports/show'
    end
  end

  private

  def set_report
    @report = Report.find(params[:report_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
