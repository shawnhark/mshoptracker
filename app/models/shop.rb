class Shop < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates_presence_of :store_name, :expenses, :ms_company
  
end