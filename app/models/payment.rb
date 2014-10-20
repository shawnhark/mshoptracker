class Payment < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates_presence_of :ms_company, :payments
end
