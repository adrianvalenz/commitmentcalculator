# frozen_string_literal: true

class CommitmentCalculatorTwo
  def self.call(prices)
    return 0 if prices.empty?

    ranked_commitments(prices).max
  end

  private_class_method def self.ranked_commitments(prices)
    prices.sort.reverse.map.with_index(1) do |price, ranking|
      price * ranking
    end
  end
end
