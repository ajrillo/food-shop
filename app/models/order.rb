class Order < ApplicationRecord
    validates :sandwich, presence: true
    validates :condiments, presence: true
    validates :quantity, presence: true
end
