class User < ApplicationRecord
    has_many :temperatures

    validates :username, presence: true
    validates :zip_code, presence: true
    validates :username, uniqueness: true
end
