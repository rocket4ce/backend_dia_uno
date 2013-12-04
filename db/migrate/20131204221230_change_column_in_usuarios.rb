class ChangeColumnInUsuarios < ActiveRecord::Migration
  def change
  	remove_index :usuarios, :email
  end
end
