class RemoveColumnsFromPayments < ActiveRecord::Migration
  def change
  	remove_column :payments, :express_token
  	remove_column :payments, :express_payer
  end
end
