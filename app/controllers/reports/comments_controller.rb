# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_report, only: :create

  def create
    super(@report)
  end

  private

  def set_report
    @report = Report.find(params[:report_id])
  end
end
