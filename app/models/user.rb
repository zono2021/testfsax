class User < ApplicationRecord
    validates :username, {presence: true}
    validates :sid, {presence: true, uniqueness: true}
    validates :email, {presence: true}
    validates :password, {presence: true}
end
