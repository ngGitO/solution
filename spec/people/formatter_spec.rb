#frozen_string_literal: true
require_relative '../spec_helper'

RSpec.describe People::Formatter do
  let(:data) { File.read('spec/fixtures/people_by_dollar.txt') }
  let(:format) { :dollar_format }
  let(:order) { :first_name }

  describe '#initialize' do
    it 'sets the formatter correctly' do
      people_format = described_class.new(format, data)

      expect(people_format.formatter.class.name).to eq('People::DollarFormatter')
    end
  end

  describe '#normalize' do
    context 'when order is given' do
      it 'normalizes the data with order' do
        result = described_class.new(format, data, order_by: order).normalize

        expect(result).to eq([
          "Rhiannon, Los Angeles, 4/30/1974",
          "Rigoberto, New York City, 1/5/1962"
        ])
      end  
    end

    context 'when order is not given' do
      it 'normalizes the data' do
        result = described_class.new(format, data).normalize

        expect(result).to eq([
          "Rhiannon, Los Angeles, 4/30/1974",
          "Rigoberto, New York City, 1/5/1962"
        ])
      end  
    end
  end
end
