require_relative 'customer'
require_relative 'repository_parser'

class CustomerRepository
  attr_reader :customers

  # def initialize(engine, csv_dir)
  #   @engine                = engine
  #   @customers             = RepositoryParser.load('./data/customers.csv', class_name: Customer)
  # end

  def initialize(file = './data/customers.csv')
    @customers = RepositoryParser.load(file, class_name: Customer)
  end

  def inspect
     "#<#{self.class} #{@customers.size} rows>"
  end

  def all
    @customers
  end

  def random
    customers.shuffle.pop
  end

  def count
    customers.count
  end

  def no_attribute_error(attribute)
    if value.class != Fixnum
      customer.send(attribute).downcase == value.downcase
    puts "That #{attribute} doesn't exist"
    end
  end

  def find_by(attribute, value)
    customers.detect do |customer|
      if !customer.respond_to?(attribute)
        no_attribute_error(attribute)
      else
      customer.send(attribute) == value
      end
    end
  end

  def find_all_by(attribute, value)
    customers.select do |customer|
      if !customer.respond_to?(attribute)
        no_attribute_error(attribute)
      else
      customer.send(attribute) == value
      end
    end
  end

  def find_by_first_name(value)
    find_by('first_name', value)
  end

  def find_by_last_name(value)
    find_by('last_name', value)
  end

  def find_by_id(value)
    find_by('id', value)
  end

  def find_all_by_first_name(value)
    find_all_by('first_name', value)
  end

  def find_all_by_last_name(value)
    find_all_by('last_name', value)
  end


end
