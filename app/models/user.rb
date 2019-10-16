class User < ApplicationRecord
    has_many :user_events, dependent: :destroy
   has_secure_password
end
