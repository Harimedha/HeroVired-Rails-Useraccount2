class User < ApplicationRecord
    has_secure_password
    validates :useremail, :username, :password, presence: true

end