class Event < ApplicationRecord
  has_many :users, through: :attendace
  has_many :attendaces, dependent: :destroy
end
