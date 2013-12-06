class AddColumnresponseToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :response, :string
    add_column :transactions, :estado, :string
  end
end
