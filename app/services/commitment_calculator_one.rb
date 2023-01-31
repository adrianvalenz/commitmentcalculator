# frozen_string_literal: true

class CommitmentCalculatorOne < ApplicationService
  def initialize(bid_prices)
    @bid_prices = bid_prices
    @results = []
  end

  def call
    if bid_prices.empty?
      0
    else
      sort_prices
      rank_prices
      highest_commitment
    end
  end

  private

  attr_reader :bid_prices

  def sort_prices
    @bid_prices = bid_prices.sort.reverse
  end

  def rank_prices
    bid_prices.each_with_index do |number, id|
      result = (id + 1) * number
      @results.push(result)
    end
  end

  def highest_commitment
    @results.max
  end
end
