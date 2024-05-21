class Admin < ApplicationRecord
    validates :admin_user, {presence: true, uniqueness: true}
    validates :admin_password, {presence: true}
    validates :admin_name, {presence: true}
    validates :admin_email, {presence: true}
end
