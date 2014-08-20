require_relative 'test_helper'
require 'csv'

class CustomerRepositoryTest < Minitest::Test

  def repository
    repository = CustomerRepository.new('./test/fixtures/customers.csv')
  end
  #
  # def test_it_loads_items_by_default
  #   customer_repository = CustomerRepository.new
  #
  #   assert_equal 1000, customer_repository.customers.length
  # end

  def test_it_can_load_other_items
    assert_equal 25, repository.customers.length
  end

  def test_it_returns_array_of_customers
    repository = CustomerRepository.new('./test/fixtures/customers.csv').all

    assert repository.is_a?(Array)
    assert repository.first.is_a?(Customer)
  end

  def test_it_has_more_than_five_customers
    assert repository.count > 5
  end

  def test_it_returns_a_random_customer
    random_customer = repository.random
    assert random_customer
  end

  def test_it_finds_single_customer_by_first_name
    result = repository.find_by_first_name('Joey')
    assert result.first_name, 'Joey'
  end

  def test_it_finds_a_single_id
    result = repository.find_by_id('1')
    assert '1', result.id
  end

  def test_it_can_find_all_by_last_name
    result = repository.find_all_by_last_name('Ondricka')
    assert 2, result.count
  end

  def test_it_responds_to_is_true_if_there_is_a_valid_attribute
    customer_data = {id: '1', first_name: 'Joey', created_at: '05/05/2014', updated_at: '04/35/2034' }
    customer = Customer.new(customer_data)
    assert customer.respond_to?('id')
    assert customer.respond_to?('first_name')
  end

  def test_it_does_not_respond_if_there_is_not_a_valid_attribute
    customer_data = {id: '1', first_name: 'Joey', created_at: '05/05/2014', updated_at: '04/35/2034' }
    customer = Customer.new(customer_data)
    refute customer.respond_to?('customer_id')
    refute customer.respond_to?('name')
  end


end
