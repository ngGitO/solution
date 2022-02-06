#frozen_string_literal: true
require_relative '../spec_helper'

RSpec.describe People::PercentFormatter do
  describe '#normalize' do
    let(:data) { File.read('spec/fixtures/people_by_percent.txt') }

    context 'when order is given' do
      let(:order) { :first_name }

      it 'normalizes the data with order' do
        result = described_class.new(data, order_by: order).normalize

        expect(result).to eq([
          "Elliot, New York City, 5/4/1947",
          "Mckayla, Atlanta, 5/29/1986"
        ])
      end  
    end

    context 'when order is not given' do
      it 'normalizes the data' do
        result = described_class.new(data).normalize

        expect(result).to eq([
          "Mckayla, Atlanta, 5/29/1986",
          "Elliot, New York City, 5/4/1947"
        ])
      end  
    end
  end
end
