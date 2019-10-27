class User < ApplicationRecord
    has_many :favorite_events, dependent: :destroy
    has_many :events, dependent: :destroy
   has_secure_password
end
