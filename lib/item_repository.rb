require_relative 'repository_parser'

class ItemRepository

  attr_reader :items

  def initialize(file = './data/items.csv')
    @items = RepositoryParser.load(file, class_name: Item)
  end
end