class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :token
      t.string :payerid

      t.timestamps
    end
  end
end
