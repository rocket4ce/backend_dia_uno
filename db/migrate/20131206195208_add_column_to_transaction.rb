class AddColumnToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :ip_address, :string
    add_column :transactions, :usuario_id, :integer
    add_index :transactions, :usuario_id
  end
end
