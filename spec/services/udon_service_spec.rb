# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UdonService do
  let(:subject) { described_class.new }

  describe '#perform!' do
    it 'respond to #perform!' do
      expect(subject).to respond_to(:perform!)
    end

    context('current hour is other than 0') do
      it 'works wo/error' do
        (1..23).to_a.each do |hour|
          travel_to Time.zone.now.change(hour: hour, sec: 1)
          expect{ subject.perform! }.not_to raise_error
        end
      end
    end

    context('current hour is 0') do
      it 'works wo/error' do
        travel_to Time.zone.now.change(hour: 0, sec: 1)
        expect{ subject.perform! }.to raise_error UdonService::UdonTimeError
      end
    end
  end
end
