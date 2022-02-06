# frozen_string_literal: true

require_relative 'dollar_formatter.rb'
require_relative 'percent_formatter.rb'

module People
  class Formatter
    attr_reader :formatter

    def initialize(type, data, order_by: nil)
      @type = type
      @order_by = order_by
      @formatter = get_formatter(data)
    end

    def normalize
      @formatter.normalize
    end

    private

    def get_formatter(data)
      case @type
      when :dollar_format
        DollarFormatter.new(data, order_by: @order_by)
      when :percent_format
        PercentFormatter.new(data, order_by: @order_by)
      else
        raise StandardError, "Required format is not supported."
      end
    end
  end
end
