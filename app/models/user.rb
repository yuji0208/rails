class User < ApplicationRecord
    validates :name, presence: true#validate=検証
    validates :email, presence: true
    
    has_secure_password
end
