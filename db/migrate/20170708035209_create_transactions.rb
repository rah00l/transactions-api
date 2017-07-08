class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :consumer, foreign_key: true
      t.references :merchant, foreign_key: true
      t.decimal :sale_amount
      t.date :date

      t.timestamps
    end
  end
end
