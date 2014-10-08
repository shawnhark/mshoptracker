class JoinShopsToUsers < ActiveRecord::Migration
#added user column to shops table instead of creating join table
  def change
    add_column :shops, :user_id, :integer
  end
end
