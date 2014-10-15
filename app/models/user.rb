class User < ActiveRecord::Base
  include Tokenable

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  validates :password, presence: true, on: :create

  has_secure_password validations: false

  has_many :shops
  has_many :payments

  def deactivate!
    update_column(:active, false)
  end

end