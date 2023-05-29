class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :articles
    has_many :comments
    has_secure_password
end
