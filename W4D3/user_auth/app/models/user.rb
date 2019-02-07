class User < ApplicationRecord
    validates :username, presence: true, 
    validates :session_token, presence: true, 
    validates :password_digest, presence: true, 
end
