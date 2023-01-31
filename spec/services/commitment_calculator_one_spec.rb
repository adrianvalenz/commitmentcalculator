require 'rails_helper'

RSpec.describe CommitmentCalculatorOne, type: :model do
  describe "#call" do
    context "No bid prices" do
      it "returns 0 commitment" do
        bid_prices = []
        commitment = CommitmentCalculatorOne.call(bid_prices)
        expect(commitment).to eq(0)
      end
    end

    context "first array of prices" do
      it "returns highest commitment" do
        bid_prices = [120, 130, 110, 180]
        commitment = CommitmentCalculatorOne.call(bid_prices)
        expect(commitment).to eq(440)
      end
    end

    context "second array of prices" do
      it "returns highest commitment" do
        bid_prices = [150, 450, 110, 500]
        commitment = CommitmentCalculatorOne.call(bid_prices)
        expect(commitment).to eq(900)
      end
    end

    context "third array of prices" do
      it "returns highest commitment" do
        bid_prices = [150, 150, 500, 110]
        commitment = CommitmentCalculatorOne.call(bid_prices)
        expect(commitment).to eq(500)
      end
    end
  end
end
