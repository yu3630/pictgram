class User < ApplicationRecord
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length:{maximum: 15}
    validates :email, presence: true, format:{with: VALID_EMAIL_REGEX}
    validates :password, presence: true, format:{with: VALID_PASSWORD_REGEX}
    has_secure_password
    
    has_many :topics
    has_many :favorites
    has_many :favorite_topics, through: :favorites, source: 'topic'
    has_many :comments
end
