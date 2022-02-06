require_relative 'people/formatter.rb'

class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    results = []
    order_by = params[:order]

    params.each_pair do |format, data|
      next unless format.to_s.include?('_format')

      results = People::Formatter.new(
        format,
        data,
        order_by: order_by
      ).normalize + results
    end

    results
  end

  private

  attr_reader :params
end
