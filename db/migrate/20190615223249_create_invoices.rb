class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.decimal :amount, null: false, precision: 15, scale: 2, default: 0
      t.string :company, null: false
      t.string :contragent, null: false
      t.string :currency, null: false
      t.date :date, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :invoices, :date
  end
end
