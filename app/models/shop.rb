class Shop < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates_presence_of :store_name, :expenses, :ms_company

  scope :present_year, lambda { |year| where("strftime('%Y', shop_date) = ?", Time.now.year) }
#  scope :current, -> { where("shop_date = ? ", Time.now.year) }
  scope :current, -> { where(shop_date: Time.now.year) }
#  scope :user_shops, -> { where("user_id = ? ", #{user.id}) }
  scope :pays_fees, -> { where(:fee > 0) }

  def self.current_year(year)
    where("strftime('%Y', shop_date) = ?", Time.now.year)
  end
  

  
end