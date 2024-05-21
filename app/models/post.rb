class Post < ApplicationRecord
    validates :body, {presence: true, length: {maximum: 500}}
end
