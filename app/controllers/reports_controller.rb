# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit]
  before_action :set_operable_report, only: %i[update destroy]

  def index
    @reports = Report.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show; end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    @report = current_user.reports.create(report_params)

    if @report.save
      redirect_to report_url(@report), notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @report.update(report_params)
      redirect_to report_url(@report), notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @report.destroy

    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def set_operable_report
    @report = current_user.reports.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content)
  end
end
