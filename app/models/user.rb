class User < ApplicationRecord
    validates :name, presence: true#validate=検証
    validates :name, length: { maximum: 15}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true
    validates :email, format: { with: VALID_EMAIL_REGEX}
    VALID_PASSWORD_REGEX = /\A(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)\z/
    validates :password, length: { in: 8..32 } 
    validates :password, presence: true
    validates :password, format: { with: VALID_PASSWORD_REGEX}
    
    has_secure_password #パスワードの実装メソッド
    
    has_many :topics #Userは複数のtopicを持つ
    has_many :favorites #Userは複数のfavoriteを持つ
    has_many :favorite_topics, through: :favorites, source: 'topic'
end
