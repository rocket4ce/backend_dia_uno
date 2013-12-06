class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :usuario, index: true
      t.references :post, index: true
      t.integer :estado
      t.string :expres_token
      t.string :express_payer

      t.timestamps
    end
  end
end
