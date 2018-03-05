class User < ApplicationRecord

  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances

  has_secure_password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
