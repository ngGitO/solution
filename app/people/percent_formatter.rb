#frozen_string_literal: true
require_relative 'format_utils.rb'

module People
  class PercentFormatter
    include FormatUtils

    FORMAT_SEQUENCE = ['first_name', 'city', 'birthdate'].freeze
    SPLIT_DELIMETER = ' % '

    def initialize(data, order_by: nil)
      @data = data
      @order_by = order_by
    end
    
    def normalize
      data = refine_data(SPLIT_DELIMETER, @data)
  
      header_row = data.first
      col_order = column_order(header_row)

      records = data[1..-1]

      records = order(records, col_order, @order_by)

      records.map do |record|
        format_record(record, col_order)
      end
    end

    private

    def format_record(record, col_order)
      FORMAT_SEQUENCE.map do |col_name|
        format_column(
          record[col_order[col_name]],
          col_name
        )
      end.join(', ')
    end

    def format_column(col, type)
      case type
      when 'birthdate'
        format_birthdate(col)
      else
        col
      end
    end

    def format_birthdate(date)
      cols = date.split('-')

      [cols[1], cols[2], cols[0]].map(&:to_i).join('/')
    end
  end
end

