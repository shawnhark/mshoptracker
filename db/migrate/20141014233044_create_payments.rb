class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :ms_company
      t.float :payments
      t.date :pay_period_start
      t.date :pay_period_end
      t.integer :user_id
      t.timestamps
    end
  end
end
