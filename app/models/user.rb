class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendance
end
