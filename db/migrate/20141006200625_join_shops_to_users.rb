class JoinShopsToUsers < ActiveRecord::Migration
  def change
    create_join_table :users, :shops do |t|
      t.timestamps
    end
  end
end
