#frozen_string_literal: true

module People
  module FormatUtils
    def refine_data(delimeter, data)
      data.split("\n").map do |record|
        record.split(delimeter)
      end
    end
    
    def column_order(col_row)
      column_info = {}

      col_row.each_with_index do |col, index|
        column_info[col] = index
      end

      column_info
    end

    def order(records, col_order, order_by)
      return records if order_by.nil?

      order_by_index = col_order[order_by.to_s]

      records.sort_by { |record| record[order_by_index] }
    end
  end
end
