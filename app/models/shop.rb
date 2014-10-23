class Shop < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates_presence_of :store_name, :expenses, :ms_company

  scope :current_year, lambda { |year| where("strftime('%Y', shop_date) = ?", Time.now.year) }

  def self.current_year(year)
    where("strftime('%Y', shop_date) = ?", Time.now.year)
  end
  

  
end