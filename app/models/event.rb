class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :favorite_events, dependent: :destroy
end
