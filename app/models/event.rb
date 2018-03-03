class Event < ApplicationRecord
  has_many :users, through: :attendance
  has_many :attendances, dependent: :destroy
end
