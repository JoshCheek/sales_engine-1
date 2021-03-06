require_relative 'test_helper'
require 'date'

class MerchantTest < Minitest::Test
  attr_reader :merchant, :repository

  def setup
    data = {id: "1", name: "Schroeder-Jerde", created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"}
    @repository = Minitest::Mock.new
    @merchant = Merchant.new(data, @repository)
  end

  def test_it_has_attributes
    assert_equal 1,                       merchant.id
    assert_equal "Schroeder-Jerde",       merchant.name
  end

  def test_it_can_find_associated_items
    repository.expect(:find_items_by_merchant_id, [], [merchant.id])
    merchant.items
    repository.verify
  end
end
