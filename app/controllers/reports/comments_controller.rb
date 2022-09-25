# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_report, only: %i[create destroy]

  def create
    super(@report)
  end

  def destroy
    super(@report, params[:id])

    redirect_to @report
  end

  private

  def set_report
    @report = Report.find(params[:report_id])
  end
end
