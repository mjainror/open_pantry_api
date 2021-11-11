class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :set_default_type!

  def generate_jwt
    JWT.encode({ id: id,
                exp: 60.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end

  def supplier?
    type == "Supplier"
  end

  def customer?
    type == "Customer"
  end

  protected

  def set_default_type!
    self.type = "Customer" if self.type.blank?
  end
end
