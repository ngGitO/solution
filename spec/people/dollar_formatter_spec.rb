#frozen_string_literal: true
require_relative '../spec_helper'

RSpec.describe People::DollarFormatter do
  describe '#normalize' do
    let(:data) { File.read('spec/fixtures/people_by_dollar.txt') }

    context 'when order is given' do
      let(:order) { :first_name }

      it 'normalizes the data with order' do
        result = described_class.new(data, order_by: order).normalize

        expect(result).to eq([
          "Rhiannon, Los Angeles, 4/30/1974",
          "Rigoberto, New York City, 1/5/1962"
        ])
      end  
    end

    context 'when order is not given' do
      it 'normalizes the data' do
        result = described_class.new(data).normalize

        expect(result).to eq([
          "Rhiannon, Los Angeles, 4/30/1974",
          "Rigoberto, New York City, 1/5/1962"
        ])
      end  
    end
  end
end
