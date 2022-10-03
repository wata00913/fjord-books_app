# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice_report = Report.where(title: '初日報').first
  end

  test 'self report is editable' do
    alice = User.where(name: 'Alice').first

    assert @alice_report.editable?(alice)
  end

  test 'other report is not editable' do
    bob = User.where(name: 'Bob').first

    assert_not @alice_report.editable?(bob)
  end
end
