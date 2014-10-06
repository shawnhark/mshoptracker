class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :store_name
      t.string :location
      t.date  :shop_date
      t.time :shop_time
      t.float :expenses
      t.float :reimbursement
      t.float :fee
      t.string :ms_company
      t.timestamps
    end
  end
end
