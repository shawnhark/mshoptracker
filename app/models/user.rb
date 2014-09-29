class User < ActiveRecord::Base
  include Tokenable

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  has_secure_password validations: false

  def deactivate!
    update_column(:active, false)
  end

end