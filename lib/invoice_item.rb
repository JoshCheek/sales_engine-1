class Invoice_item

  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at

  def initialize(data, repository)
    @id =                          data[:id]
    @item_id =                     data[:item_id]
    @invoice_id =                  data[:invoice_id]
    @quantity =                    data[:quantity]
    @unit_price =                  data[:unit_price]
    @created_at =                  data[:created_at]
    @updated_at =                  data[:updated_at]
    @invoice_item_repository =     repository                  
  end
end
