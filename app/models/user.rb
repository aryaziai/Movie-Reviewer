class User < ApplicationRecord
    has_many :reviews
    has_many :movies, through: :reviews

    has_many :comments

    has_many :likes
    has_many :likes, through: :reviews
    

    has_secure_password
    validates :name, presence: true, uniqueness: true
    validates :password, presence: true, length: { in: 6..15 }
    validates :email, presence: true
    
end
