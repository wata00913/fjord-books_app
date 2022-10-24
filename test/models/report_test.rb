# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice_report = reports(:alice_report)
  end

  test 'self report is editable' do
    alice = users(:alice)

    assert @alice_report.editable?(alice)
  end

  test 'other report is not editable' do
    bob = users(:bob)

    assert_not @alice_report.editable?(bob)
  end

  test 'created_on' do
    assert_equal Date.new(2021, 1, 1), reports(:bob_report).created_on
  end
end
